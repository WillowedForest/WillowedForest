#!/bin/bash

# Check AstroVials stock status and send KDE desktop notification

URL="https://astrovials.com/product/estradiol-enanthate/"
PRODUCT_NAME="Estradiol Enanthate"

# Fetch the page
PAGE=$(curl -s -A "Mozilla/5.0 (X11; Linux x86_64)" "$URL" 2>/dev/null)

if [ -z "$PAGE" ]; then
    notify-send "$PRODUCT_NAME - Stock Check" "Failed to fetch page" -u low
    exit 1
fi

# Check for "out of stock" FIRST (check this before "in stock" to avoid false matches)
if echo "$PAGE" | grep -qi "out-of-stock\|out of stock"; then
    #notify-send "$PRODUCT_NAME - Stock Check" "$PRODUCT_NAME is OUT OF STOCK" -u low
    exit 1

# Check for "in stock" text
elif echo "$PAGE" | grep -qi "in stock"; then


    if [ -z "$QUANTITY" ]; then
        QUANTITY="In stock"
    fi

    notify-send "✓ Stock Available!" "✓ $PRODUCT_NAME is IN STOCK!\n$QUANTITY" -u low
    exit 0

# Could not determine status
else
    notify-send "$PRODUCT_NAME - Stock Check" "Could not determine stock status" -u low
    exit 2
fi
