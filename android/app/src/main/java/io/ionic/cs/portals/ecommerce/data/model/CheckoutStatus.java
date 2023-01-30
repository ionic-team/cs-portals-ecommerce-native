package io.ionic.cs.portals.ecommerce.data.model;

import androidx.annotation.NonNull;

public enum CheckoutStatus {
    COMPLETED("success"),
    CANCELLED("cancel"),
    FAILED("failure");

    private final String status;

    CheckoutStatus(String status) {
        this.status = status;
    }

    @NonNull
    public String toString() {
        return this.status;
    }
}
