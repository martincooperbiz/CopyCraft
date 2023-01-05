#!/bin/bash

# If $WC_VERSION is not defined or is set to "latest", then download latest version. Else download the version specified.
if [ -z "$WC_VERSION" ] || [ "$WC_VERSION" == "latest" ]; then
	echo "Installing and activating latest WooCommerce version ..."
	wp plugin install woocommerce --activate
else
	echo "Installing and activating WooCommerce version $WC_VERSION ..."
	wp plugin install woocommerce --version="$WC_VERSION" --activate
fi

echo "Install Storefront"
wp theme install storefront --activate

echo "Creating WooCommerce Customer Account"
wp user create customer customer@woocommercecoree2etestsuite.com \
	--user_pass=password \
	--role=subscriber \
	--first_name='Jane' \
	--last_name='Smith' \
	--path=/var/www/html

echo "Adding basic WooCommerce settings..."
wp option set woocommerce_store_address "Example Address Line 1"
wp option set woocommerce_store_address_2 "Example Address Line 2"
wp option set woocommerce_store_city "Example City"
wp option set woocommerce_default_country "US:CA"
wp option set woocommerce_store_postcode "94110"
wp option set woocommerce_currency "USD"
wp option set woocommerce_product_type "both"
wp option set woocommerce_allow_tracking "no"

echo "Importing WooCommerce shop pages..."
wp wc --user=admin tool run install_pages

echo "Installing and activating the WordPress Importer plugin..."
wp plugin install wordpress-importer --activate

echo "Importing WooCommerce sample products..."
wp import wp-content/plugins/woocommerce/sample-data/sample_products.xml --authors=skip

echo "Installing basic-auth to interact with the API..."
wp plugin install https://github.com/WP-API/basic-auth/archive/master.zip --activate

# install the WP Mail Logging plugin to test emails
wp plugin install wp-mail-logging --activate

echo "Activate CopyCraft Plugin"
wp plugin activate copycraft

# Create "Ready" page so that node_modules/@woocommerce/e2e-environment/bin/wait-for-build.sh script can check if the site is ready.
wp post create --post_type=page --post_title='Ready'

echo "Success! Your E2E Test Environment is now ready."
