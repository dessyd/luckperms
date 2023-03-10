#!/bin/bash
RCON_HOST=mc

exec_rcon () {
  docker compose exec -i $RCON_HOST rcon-cli $*
  sleep 1
}

while IFS= read -r line
do
  # display $line or do somthing with $line
	printf '%s\n' "$line"
  exec_rcon $line
done < lp.txt
