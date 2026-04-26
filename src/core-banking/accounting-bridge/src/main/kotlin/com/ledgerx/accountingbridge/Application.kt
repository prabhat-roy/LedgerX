package com.ledgerx.accountingbridge

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@SpringBootApplication
@RestController
class Application {
    @GetMapping("/healthz")
    fun health(): Map<String, String> = mapOf("status" to "ok", "service" to "accounting-bridge")
}

fun main(args: Array<String>) { runApplication<Application>(*args) }
