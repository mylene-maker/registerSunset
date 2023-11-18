package com.businesscase.sunsetregister.enums;

public enum Country {
    USA("États-Unis"),
    CANADA("Canada"),
    FRANCE("France"),
    GERMANY("Allemagne"),
    UNITED_KINGDOM("Royaume-Uni"),
    JAPAN("Japon"),
    AUSTRALIA("Australie"),
    BRAZIL("Brésil"),
    INDIA("Inde"),
    CHINA("Chine"),
    SOUTH_KOREA("Corée du Sud"),
    RUSSIA("Russie"),
    SOUTH_AFRICA("Afrique du Sud"),
    MEXICO("Mexique"),
    ARGENTINA("Argentine");

    private String displayName;

    private Country(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
