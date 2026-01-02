# TP-27-Test-de-charge-Observabilit-Concurrence-Verrou-DB-Resilience4j-Actuator-Metrics
## Partie A — Préparer le terrain (données de test)
###  Étape A1 — Créer un livre avec stock connu
<img width="1304" height="88" alt="image" src="https://github.com/user-attachments/assets/1d620670-ca97-4ea8-bda4-b5bc509f5bbd" />
### Étape A2 — Récupérer l’ID du livre
<img width="1304" height="88" alt="image" src="https://github.com/user-attachments/assets/df12428d-bb80-46e0-9839-6b8348b6d6a5" />

## Partie B — Étape “sanity check” : 1 emprunt simple
### Étape B1 — Tester borrow une fois (sans concurrence)
<img width="1378" height="88" alt="image" src="https://github.com/user-attachments/assets/a07d959e-8226-46c0-b0d2-f6b98d84e061" />

## Étape C2 — Lancer le test
<img width="2422" height="606" alt="image" src="https://github.com/user-attachments/assets/6207e8c4-2328-4dd6-8a05-231943ec3cff" />
## Partie E — Vérifier “Stock jamais négatif” (preuve de verrou DB)
### Étape E1 — Lire l’état du stock final
<img width="1238" height="100" alt="image" src="https://github.com/user-attachments/assets/2723d582-21cc-4778-8a2a-ac36b9b7959a" />
## Partie F — Résilience en charge : pricing down → fallback
### Étape F1 — Stop pricing-service
<img width="1288" height="116" alt="image" src="https://github.com/user-attachments/assets/ad461a6d-445c-4752-897c-6c3ab1edeb42" />
### Étape F2 — Créer un nouveau livre avec stock 10
<img width="1828" height="224" alt="image" src="https://github.com/user-attachments/assets/3837a6e5-45ec-4d38-b8f4-098ecb658687" />
### Étape F3 — Relancer le test de charge (30 requêtes)
<img width="2596" height="664" alt="image" src="https://github.com/user-attachments/assets/8f8d6b28-0dc8-4579-9e3a-f4d01580d647" />
### Étape F4 — Relancer pricing-service
<img width="2764" height="250" alt="image" src="https://github.com/user-attachments/assets/4221eaeb-9a4c-4dca-9de2-a14757f6a5da" />

## Partie G — Observabilité : Actuator Metrics (Retry + CircuitBreaker)
### Étape G1 — Exposer /actuator/metrics dans book-service
<img width="2916" height="436" alt="image" src="https://github.com/user-attachments/assets/3e8e1895-0962-4382-b48a-fd535c8f8e60" />
### Étape G2 — Trouver les métriques Resilience4j
<img width="2916" height="436" alt="image" src="https://github.com/user-attachments/assets/1e773dda-6b41-4bed-8a1b-71311359a5dd" />
