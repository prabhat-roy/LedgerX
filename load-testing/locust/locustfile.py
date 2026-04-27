from locust import HttpUser, task, between, events
class LedgerXUser(HttpUser):
    wait_time = between(0.5, 3)
    host = "https://ledgerx.internal"
    @task(3)
    def list(self):  self.client.get("/api/list")
    @task(2)
    def detail(self): self.client.get("/api/detail/sample-id")
    @task(1)
    def search(self): self.client.get("/api/search?q=test")
class AdminUser(HttpUser):
    wait_time = between(2, 8)
    host = "https://admin.ledgerx.internal"
    @task
    def dashboard(self): self.client.get("/dashboard")
class APIUser(HttpUser):
    wait_time = between(0.1, 0.5)
    host = "https://api.ledgerx.internal"
    @task
    def healthz(self): self.client.get("/healthz")
