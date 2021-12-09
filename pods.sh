example="NAME                                READY     STATUS    RESTARTS   AGE
nginx-deployment-308141006-inp6w   1/1       Running   0          10s
nginx-deployment-308141006-gu3fm   1/1       Running   0          11s
other-deployment-308141006-mgu3f   1/1       Running   0          12s
mongo-deployment-308141006-3fmgu   1/1       Running   0          13s
"

declare -A service_ports
service_ports["nginx"]=8080
service_ports["mongo"]=27017

for service in ${!service_ports[*]}
do
 pod=`echo "$example" | grep "$service-deployment" | head -n 1 | cut -d ' ' -f1`
 port=${service_ports[$service]}
 command="kubectl port-forward $pod $port:$port"
 echo $command
done
