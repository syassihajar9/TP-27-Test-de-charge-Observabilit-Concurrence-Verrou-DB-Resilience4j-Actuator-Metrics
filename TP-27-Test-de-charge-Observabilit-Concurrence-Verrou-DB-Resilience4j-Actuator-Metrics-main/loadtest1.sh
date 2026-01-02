cat > loadtest.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

BOOK_ID="${1:-1}"
REQUESTS="${2:-50}"
PORTS=(8081 8083 8084)

echo "== Load test =="
echo "BookId=$BOOK_ID Requests=$REQUESTS"
echo "Ports=${PORTS[*]}"
echo ""

tmp="$(mktemp)"
pids=()

for ((i=1; i<=REQUESTS; i++)); do
  port="${PORTS[i % 3]}"
  url="http://localhost:${port}/api/books/${BOOK_ID}/borrow"

  (
    # -s silent, -o body to stdout capture, -w status code at end
    body_and_code="$(curl -s -w "\n%{http_code}" -X POST "$url" || true)"
    code="$(echo "$body_and_code" | tail -n 1)"
    body="$(echo "$body_and_code" | sed '$d')"
    echo "$port $code $body" >> "$tmp"
  ) &
  pids+=("$!")
done

# attendre tous les jobs
for pid in "${pids[@]}"; do wait "$pid"; done

success=$(awk '$2==200{c++} END{print c+0}' "$tmp")
conflict=$(awk '$2==409{c++} END{print c+0}' "$tmp")
other=$((REQUESTS - success - conflict))

echo "== Résultats =="
echo "Success (200):  $success"
echo "Conflict (409): $conflict"
echo "Other:          $other"

rm -f "$tmp"
EOF

chmod +x loadtest.sh
