#
# Whitelist appropriate assets files.
# This file is automatically generated via File.allowed_extensions configuration
# See AssetAdapter::renderTemplate() for reference.
#

# We disable PHP via several methods
# Replace the handler with the default plaintext handler
AddHandler default-handler php phtml php3 php4 php5 inc

<IfModule mod_php5.c>
    # Turn the PHP engine off
    php_flag engine off
</IfModule>

<IfModule mod_rewrite.c>
    <IfModule mod_env.c>
        SetEnv HTTP_MOD_REWRITE On
    </IfModule>

    RewriteEngine On

    # Allow error pages
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule error[^\\\\/]*\\.html$ - [L]

    # Allow specific file extensions
    RewriteCond %{REQUEST_URI} !^[^.]*[^\\/]*\\.(?i:css|js<% loop $AllowedExtensions %>|$Extension<% end_loop %>)$
    RewriteRule .* - [F]

    # Non existant files passed to requesthandler
    RewriteCond %{REQUEST_URI} ^(.*)$
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule .* ../index.php [QSA]
</IfModule>
