-- Initialize WordPress databases and users for the shared MariaDB instance
-- This script runs only on first container initialization (docker-entrypoint-initdb.d)

CREATE DATABASE IF NOT EXISTS `wp_site_1_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `wp_site_2_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `wp_site_3_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `wp_site_4_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Grant privileges to root user (root exists by default). If you prefer a dedicated user,
-- replace 'root'@'%' with 'wp_user'@'%' and create the user with a secure password.
GRANT ALL PRIVILEGES ON `wp_site_1_db`.* TO 'root'@'%' ;
GRANT ALL PRIVILEGES ON `wp_site_2_db`.* TO 'root'@'%' ;
GRANT ALL PRIVILEGES ON `wp_site_3_db`.* TO 'root'@'%' ;
GRANT ALL PRIVILEGES ON `wp_site_4_db`.* TO 'root'@'%' ;

FLUSH PRIVILEGES;
