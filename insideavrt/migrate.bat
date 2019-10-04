@echo off

echo Running migrations...
php app/console doctrine:migrations:migrate --no-interaction
php app/console doctrine:schema:update --no-interaction --force
echo Migrations complete!