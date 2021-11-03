#! /bin/bash

echo "Seeding database"

export PGPASSWORD=$POSTGRESQL_PASSWORD

psql -h $POSTGRESQL_SERVICE -d $POSTGRESQL_DATABASE -U $POSTGRESQL_USER -w < /tmp/init-files/schema.sql

psql -h $POSTGRESQL_SERVICE -U $POSTGRESQL_USER -d $POSTGRESQL_DATABASE -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ${POSTGRESQL_USER};"
psql -h $POSTGRESQL_SERVICE -U $POSTGRESQL_USER -d $POSTGRESQL_DATABASE -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO ${POSTGRESQL_USER};"

