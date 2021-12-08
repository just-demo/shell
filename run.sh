python3 ./service.py 5001 &
python3 ./service.py 5002 &

trap 'kill $(jobs -p)' EXIT
sleep infinity


