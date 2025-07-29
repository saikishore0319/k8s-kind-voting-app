#!/bin/sh
set -e

# Check if PostgreSQL is ready
PGPASSWORD=postgres pg_isready -h db -U postgres

# Check if Redis is ready
redis-cli -h redis ping | grep -q PONG

# Check if the "votes" table exists in Postgres
PGPASSWORD=postgres psql -h db -U postgres -d postgres -tAc "SELECT to_regclass('public.votes')" | grep -q votes

