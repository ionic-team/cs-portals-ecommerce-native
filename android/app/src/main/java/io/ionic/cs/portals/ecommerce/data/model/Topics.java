package io.ionic.cs.portals.ecommerce.data.model;

import androidx.annotation.NonNull;

public enum Topics {
    SYNC_LIVE_UPDATE("live-update:sync"),
    SELECT_FEATURED_ITEM("featured:select-item"),
    DISMISS_MODAL("modal:dismiss");

    private final String topic;

    Topics(String topic) {
        this.topic = topic;
    }

    @NonNull
    public String toString() {
        return this.topic;
    }
}
