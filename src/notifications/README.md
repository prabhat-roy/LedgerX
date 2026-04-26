# notifications — LedgerX

Multi-channel customer messaging.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| notification-orchestrator | node | 60240 | Multi-channel orchestrator + templates |
| sms-service | node | 60241 | SMS / OTP dispatch |
| email-service | node | 60242 | Email dispatch (transactional) |
| push-service | go | 60243 | Push notifications (APNs/FCM) |
| in-app-service | node | 60244 | In-app message inbox |
| statement-doc-service | java | 60245 | Statement & advice document service |
| whatsapp-service | node | 60246 | WhatsApp Business API integration |
| voice-ivr-service | node | 60247 | Voice IVR + outbound dialler |
| webhook-service | node | 60248 | Webhook delivery service |
| preference-center | node | 60249 | Customer preference center |
