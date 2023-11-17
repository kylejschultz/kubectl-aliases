# Confirm command to be executed
confirm() {
  echo -n "\e[33mDo you want to run $*? [N/yes] \e[m"
  read REPLY

  # if test "$REPLY" = "y" -o "$REPLY" = "Y"; then
  if test "$REPLY" = "yes"; then
    "$@"
  else
      echo "Cancelled by user"
  fi
}

# Force confirmation before using kaf (kubectl apply -f $1)
safe_kubectlapply() {
  context=$(kubectl config current-context)
  echo "\n"
  echo "BECAREFUL!!! APPLYING TO \e[31m$context\e[m"
  confirm kubectl apply -f "$@"
}

if (( $+commands[kubectl] )); then
    __KUBECTL_COMPLETION_FILE="${ZSH_CACHE_DIR}/kubectl_completion"

    if [[ ! -f $__KUBECTL_COMPLETION_FILE ]]; then
        kubectl completion zsh >! $__KUBECTL_COMPLETION_FILE
    fi

    [[ -f $__KUBECTL_COMPLETION_FILE ]] && source $__KUBECTL_COMPLETION_FILE

    unset __KUBECTL_COMPLETION_FILE
fi

alias k=kubectl
#
# Cluster Roles and Cluster Role Bindings
#
alias kgcr='kubectl get clusterrole'
alias kgcrw='kubectl get clusterrole --watch'
alias kecr='kubectl edit clusterrole'
alias kdcr='kubectl describe clusterrole'
alias kdelcr='kubectl delete clusterrole'
alias kgcrb='kubectl get clusterrolebinding'
alias kgcrbw='kubectl get clusterrolebinding --watch'
alias kecrb='kubectl edit clusterrolebinding'
alias kdcrb='kubectl describe clusterrolebinding'
alias kdelcrb='kubectl delete clusterrolebinding'
#
# Jobs and Cronjobs
#
alias kgcj='kubectl get cronjob'
alias kgcjw='kubectl get cronjob --watch'
alias kgcjn='kubectl get cronjob --namespace'
alias kgcjnw='kubectl get cronjob --watch --namespace'
alias kgcja='kubectl get cronjob --all-namespaces'
alias kgcjaw='kubectl get cronjob --all-namespaces --watch'
alias kecj='kubectl edit cronjob'
alias kecjn='kubectl edit cronjob --namespace'
alias kdcj='kubectl describe cronjob'
alias kdcjn='kubectl describe cronjob --namespace'
alias kdelcj='kubectl delete cronjob'
alias kdelcjn='kubectl delete cronjob --namespace'
alias kgj='kubectl get job'
alias kgjw='kubectl get job --watch'
alias kgjn='kubectl get job --namespace'
alias kgjnw='kubectl get job --watch --namespace'
alias kgja='kubectl get job --all-namespaces'
alias kgjaw='kubectl get job --all-namespaces --watch'
alias kej='kubectl edit job'
alias kejn='kubectl edit job --namespace'
alias kdj='kubectl describe job'
alias kdjn='kubectl describe job --namespace'
alias kdelj='kubectl delete job'
alias kdeljn='kubectl delete job --namespace'
#
# Daemon Sets
#
alias kgds='kubectl get daemonset'
alias kgdsw='kubectl get daemonset --watch'
alias kgdsn='kubectl get daemonset --namespace'
alias kgdsnw='kubectl get daemonset --watch --namespace'
alias kgdsa='kubectl get daemonset --all-namespaces'
alias kgdsaw='kubectl get daemonset --all-namespaces --watch'
alias keds='kubectl edit daemonset'
alias kedsn='kubectl edit daemonset --namespace'
alias kdds='kubectl describe daemonset'
alias kddsn='kubectl describe daemonset --namespace'
alias kdelds='kubectl delete daemonset'
alias kdeldsn='kubectl delete daemonset --namespace'
#
# Roles and Rolebindings
#
alias kgr='kubectl get role'
alias kgrw='kubectl get role --watch'
alias kgrn='kubectl get role --namespace'
alias kgrnw='kubectl get role --watch --namespace'
alias kgra='kubectl get role --all-namespaces'
alias kgraw='kubectl get role --all-namespaces --watch'
alias ker='kubectl edit role'
alias kern='kubectl edit role --namespace'
alias kdr='kubectl describe role'
alias kdrn='kubectl describe role --namespace'
alias kdelr='kubectl delete role'
alias kdelrn='kubectl delete role --namespace'
alias kgrb='kubectl get rolebinding'
alias kgrbw='kubectl get rolebinding --watch'
alias kgrbn='kubectl get rolebinding --namespace'
alias kgrbnw='kubectl get rolebinding --watch --namespace'
alias kgrba='kubectl get rolebinding --all-namespaces'
alias kgrbaw='kubectl get rolebinding --all-namespaces --watch'
alias kerb='kubectl edit rolebinding'
alias kerbn='kubectl edit rolebinding --namespace'
alias kdrb='kubectl describe rolebinding'
alias kdrbn='kubectl describe rolebinding --namespace'
alias kdelrb='kubectl delete rolebinding'
alias kdelrbn='kubectl delete rolebinding --namespace'
#
# Pods, Pod Templates, Pod Disruption Budgets, Pod Security Policy
# 
alias kgp='kubectl get pod'
alias kgpw='kubectl get pod --watch'
alias kgpn='kubectl get pod --namespace'
alias kgpnw='kubectl get pod --watch --namespace'
alias kgpa='kubectl get pod --all-namespaces'
alias kgpaw='kubectl get pod --all-namespaces --watch'
alias kep='kubectl edit pod'
alias kepn='kubectl edit pod --namespace'
alias kdp='kubectl describe pod'
alias kdpn='kubectl describe pod --namespace'
alias kdelp='kubectl delete pod'
alias kdelpn='kubectl delete pod --namespace'
alias kgpt='kubectl get podtemplate'
alias kgptw='kubectl get podtemplate --watch'
alias kgptn='kubectl get podtemplate --namespace'
alias kgptnw='kubectl get podtemplate --watch --namespace'
alias kgpta='kubectl get podtemplate --all-namespaces'
alias kgptaw='kubectl get podtemplate --all-namespaces --watch'
alias kept='kubectl edit podtemplate'
alias keptn='kubectl edit podtemplate --namespace'
alias kdpt='kubectl describe podtemplate'
alias kdptn='kubectl describe podtemplate --namespace'
alias kdelpt='kubectl delete podtemplate'
alias kdelptn='kubectl delete podtemplate --namespace'
alias kgpdb='kubectl get poddisruptionbudget'
alias kgpdbw='kubectl get poddisruptionbudget --watch'
alias kgpdbn='kubectl get poddisruptionbudget --namespace'
alias kgpdbnw='kubectl get poddisruptionbudget --watch --namespace'
alias kgpdba='kubectl get poddisruptionbudget --all-namespaces'
alias kgpdbaw='kubectl get poddisruptionbudget --all-namespaces --watch'
alias kepdb='kubectl edit poddisruptionbudget'
alias kepdbn='kubectl edit poddisruptionbudget --namespace'
alias kdpdb='kubectl describe poddisruptionbudget'
alias kdpdbn='kubectl describe poddisruptionbudget --namespace'
alias kdelpdb='kubectl delete poddisruptionbudget'
alias kdelpdbn='kubectl delete poddisruptionbudget --namespace'
alias kgpsp='kubectl get podsecuritypolicy'
alias kgpspw='kubectl get podsecuritypolicy --watch'
alias kepsp='kubectl edit podsecuritypolicy'
alias kdpsp='kubectl describe podsecuritypolicy'
alias kdelpsp='kubectl delete podsecuritypolicy'
#
# Deployments, Stateful Sets, Replica Sets, HPA
#
alias kgd='kubectl get deployment'
alias kgdw='kubectl get deployment --watch'
alias kgdn='kubectl get deployment --namespace'
alias kgdnw='kubectl get deployment --watch --namespace'
alias kgda='kubectl get deployment --all-namespaces'
alias kgdaw='kubectl get deployment --all-namespaces --watch'
alias ked='kubectl edit deployment'
alias kedn='kubectl edit deployment --namespace'
alias kdd='kubectl describe deployment'
alias kddn='kubectl describe deployment --namespace'
alias kdeld='kubectl delete deployment'
alias kdeldn='kubectl delete deployment --namespace'
alias kgss='kubectl get statefulset'
alias kgssw='kubectl get statefulset --watch'
alias kgssn='kubectl get statefulset --namespace'
alias kgssnw='kubectl get statefulset --watch --namespace'
alias kgssa='kubectl get statefulset --all-namespaces'
alias kgssaw='kubectl get statefulset --all-namespaces --watch'
alias kess='kubectl edit statefulset'
alias kessn='kubectl edit statefulset --namespace'
alias kdss='kubectl describe statefulset'
alias kdssn='kubectl describe statefulset --namespace'
alias kdelss='kubectl delete statefulset'
alias kdelssn='kubectl delete statefulset --namespace'
alias kgrs='kubectl get replicaset'
alias kgrsw='kubectl get replicaset --watch'
alias kgrsn='kubectl get replicaset --namespace'
alias kgrsnw='kubectl get replicaset --watch --namespace'
alias kgrsa='kubectl get replicaset --all-namespaces'
alias kgrsaw='kubectl get replicaset --all-namespaces --watch'
alias kers='kubectl edit replicaset'
alias kersn='kubectl edit replicaset --namespace'
alias kdrs='kubectl describe replicaset'
alias kdrsn='kubectl describe replicaset --namespace'
alias kdelrs='kubectl delete replicaset'
alias kdelrsn='kubectl delete replicaset --namespace'
alias kghpa='kubectl get horizontalpodautoscaler'
alias kghpaw='kubectl get horizontalpodautoscaler --watch'
alias kghpan='kubectl get horizontalpodautoscaler --namespace'
alias kghpanw='kubectl get horizontalpodautoscaler --watch --namespace'
alias kghpaa='kubectl get horizontalpodautoscaler --all-namespaces'
alias kghpaaw='kubectl get horizontalpodautoscaler --all-namespaces --watch'
alias kehpa='kubectl edit horizontalpodautoscaler'
alias kehpan='kubectl edit horizontalpodautoscaler --namespace'
alias kdhpa='kubectl describe horizontalpodautoscaler'
alias kdhpan='kubectl describe horizontalpodautoscaler --namespace'
alias kdelhpa='kubectl delete horizontalpodautoscaler'
alias kdelhpan='kubectl delete horizontalpodautoscaler --namespace'
#
# Storage
#
alias kgpvc='kubectl get persistentvolumeclaim'
alias kgpvcw='kubectl get persistentvolumeclaim --watch'
alias kgpvcn='kubectl get persistentvolumeclaim --namespace'
alias kgpvcnw='kubectl get persistentvolumeclaim --watch --namespace'
alias kgpvca='kubectl get persistentvolumeclaim --all-namespaces'
alias kgpvcaw='kubectl get persistentvolumeclaim --all-namespaces --watch'
alias kepvc='kubectl edit persistentvolumeclaim'
alias kepvcn='kubectl edit persistentvolumeclaim --namespace'
alias kdpvc='kubectl describe persistentvolumeclaim'
alias kdpvcn='kubectl describe persistentvolumeclaim --namespace'
alias kdelpvc='kubectl delete persistentvolumeclaim'
alias kdelpvcn='kubectl delete persistentvolumeclaim --namespace'
alias kgpv='kubectl get persistentvolume'
alias kgpvw='kubectl get persistentvolume --watch'
alias kepv='kubectl edit persistentvolume'
alias kdpv='kubectl describe persistentvolume'
alias kdelpv='kubectl delete persistentvolume'
alias kgsc='kubectl get storageclass'
alias kgscw='kubectl get storageclass --watch'
alias kesc='kubectl edit storageclass'
alias kdsc='kubectl describe storageclass'
alias kdelsc='kubectl delete storageclass'
#
# Ingress and Services
#
alias kgi='kubectl get ingress'
alias kgiw='kubectl get ingress --watch'
alias kgin='kubectl get ingress --namespace'
alias kginw='kubectl get ingress --watch --namespace'
alias kgia='kubectl get ingress --all-namespaces'
alias kgiaw='kubectl get ingress --all-namespaces --watch'
alias kei='kubectl edit ingress'
alias kein='kubectl edit ingress --namespace'
alias kdi='kubectl describe ingress'
alias kdin='kubectl describe ingress --namespace'
alias kdeli='kubectl delete ingress'
alias kdelin='kubectl delete ingress --namespace'
alias kgsvc='kubectl get service'
alias kgsvcw='kubectl get service --watch'
alias kgsvcn='kubectl get service --namespace'
alias kgsvcnw='kubectl get service --watch --namespace'
alias kgsvca='kubectl get service --all-namespaces'
alias kgsvcaw='kubectl get service --all-namespaces --watch'
alias kesvc='kubectl edit service'
alias kesvcn='kubectl edit service --namespace'
alias kdsvc='kubectl describe service'
alias kdsvcn='kubectl describe service --namespace'
alias kdelsvc='kubectl delete service'
alias kdelsvcn='kubectl delete service --namespace'
#
# Secrets and Config Maps
#
alias kgsec='kubectl get secret'
alias kgsecw='kubectl get secret --watch'
alias kgsecn='kubectl get secret --namespace'
alias kgsecnw='kubectl get secret --watch --namespace'
alias kgseca='kubectl get secret --all-namespaces'
alias kgsecaw='kubectl get secret --all-namespaces --watch'
alias kesec='kubectl edit secret'
alias kesecn='kubectl edit secret --namespace'
alias kdsec='kubectl describe secret'
alias kdsecn='kubectl describe secret --namespace'
alias kdelsec='kubectl delete secret'
alias kdelsecn='kubectl delete secret --namespace'
alias kgcm='kubectl get configmap'
alias kgcmw='kubectl get configmap --watch'
alias kgcmn='kubectl get configmap --namespace'
alias kgcmnw='kubectl get configmap --watch --namespace'
alias kgcma='kubectl get configmap --all-namespaces'
alias kgcmaw='kubectl get configmap --all-namespaces --watch'
alias kecm='kubectl edit configmap'
alias kecmn='kubectl edit configmap --namespace'
alias kdcm='kubectl describe configmap'
alias kdcmn='kubectl describe configmap --namespace'
alias kdelcm='kubectl delete configmap'
alias kdelcmn='kubectl delete configmap --namespace'
#
# Service Accounts
#
alias kgsa='kubectl get serviceaccount'
alias kgsaw='kubectl get serviceaccount --watch'
alias kgsan='kubectl get serviceaccount --namespace'
alias kgsanw='kubectl get serviceaccount --watch --namespace'
alias kgsaa='kubectl get serviceaccount --all-namespaces'
alias kgsaaw='kubectl get serviceaccount --all-namespaces --watch'
alias kesa='kubectl edit serviceaccount'
alias kesan='kubectl edit serviceaccount --namespace'
alias kdsa='kubectl describe serviceaccount'
alias kdsan='kubectl describe serviceaccount --namespace'
alias kdelsa='kubectl delete serviceaccount'
alias kdelsan='kubectl delete serviceaccount --namespace'
#
# Nodes, Events, Namespaces
#
alias kgno='kubectl get node'
alias kgnow='kubectl get node --watch'
alias keno='kubectl edit node'
alias kdno='kubectl describe node'
alias kdelno='kubectl delete node'
alias kgev='kubectl get event'
alias kgevw='kubectl get event --watch'
alias kgns='kubectl get namespace'
alias kgnsw='kubectl get namespace --watch'
alias kens='kubectl edit namespace'
alias kdns='kubectl describe namespace'
alias kdelns='kubectl delete namespace'
#
# Certificates and Security
#
alias kgcsr='kubectl get certificatesigningrequest'
alias kgcsrw='kubectl get certificatesigningrequest --watch'
alias kecsr='kubectl edit certificatesigningrequest'
alias kdcsr='kubectl describe certificatesigningrequest'
alias kdelcsr='kubectl delete certificatesigningrequest'
#
# Istio Virtual Servicxes, Gateways, and Destination Rules
#
alias kgvs='kubectl get virtualservices.networking.istio.io'
alias kgvsw='kubectl get virtualservices.networking.istio.io --watch'
alias kgvsn='kubectl get virtualservices.networking.istio.io --namespace'
alias kgvsnw='kubectl get virtualservices.networking.istio.io --watch --namespace'
alias kgvsa='kubectl get virtualservices.networking.istio.io --all-namespaces'
alias kgvsaw='kubectl get virtualservices.networking.istio.io --all-namespaces --watch'
alias kdvs='kubectl describe virtualservices.networking.istio.io'
alias kgg='kubectl get gateways.networking.istio.io'
alias kggw='kubectl get gateways.networking.istio.io --watch'
alias kggn='kubectl get gateways.networking.istio.io --namespace'
alias kggnw='kubectl get gateways.networking.istio.io --watch --namespace'
alias kgga='kubectl get gateways.networking.istio.io --all-namespaces'
alias kggaw='kubectl get gateways.networking.istio.io --all-namespaces --watch'
alias kgdr='kubectl get destinationrules.networking.istio.io'
alias kddr='kubectl describe destinationrules.networking.istio.io'

#
# Network Policies, Endpoints,
#
alias kgep='kubectl get endpoints'
alias kgepw='kubectl get endpoints --watch'
alias kgepn='kubectl get endpoints --namespace'
alias kgepnw='kubectl get endpoints --watch --namespace'
alias kgepa='kubectl get endpoints --all-namespaces'
alias kgepaw='kubectl get endpoints --all-namespaces --watch'
alias keep='kubectl edit endpoints'
alias keepn='kubectl edit endpoints --namespace'
alias kdep='kubectl describe endpoints'
alias kdepn='kubectl describe endpoints --namespace'
alias kdelep='kubectl delete endpoints'
alias kdelepn='kubectl delete endpoints --namespace'
alias kgnp='kubectl get networkpolicy'
alias kgnpw='kubectl get networkpolicy --watch'
alias kgnpn='kubectl get networkpolicy --namespace'
alias kgnpnw='kubectl get networkpolicy --watch --namespace'
alias kgnpa='kubectl get networkpolicy --all-namespaces'
alias kgnpaw='kubectl get networkpolicy --all-namespaces --watch'
alias kenp='kubectl edit networkpolicy'
alias kenpn='kubectl edit networkpolicy --namespace'
alias kdnp='kubectl describe networkpolicy'
alias kdnpn='kubectl describe networkpolicy --namespace'
alias kdelnp='kubectl delete networkpolicy'
alias kdelnpn='kubectl delete networkpolicy --namespace'


alias kgcs='kubectl get componentstatus'
alias kgcsw='kubectl get componentstatus --watch'
alias kecs='kubectl edit componentstatus'
alias kdcs='kubectl describe componentstatus'
alias kdelcs='kubectl delete componentstatus'
alias kgrc='kubectl get replicationcontroller'
alias kgrcw='kubectl get replicationcontroller --watch'
alias kgrcn='kubectl get replicationcontroller --namespace'
alias kgrcnw='kubectl get replicationcontroller --watch --namespace'
alias kgrca='kubectl get replicationcontroller --all-namespaces'
alias kgrcaw='kubectl get replicationcontroller --all-namespaces --watch'
alias kerc='kubectl edit replicationcontroller'
alias kercn='kubectl edit replicationcontroller --namespace'
alias kdrc='kubectl describe replicationcontroller'
alias kdrcn='kubectl describe replicationcontroller --namespace'
alias kdelrc='kubectl delete replicationcontroller'
alias kdelrcn='kubectl delete replicationcontroller --namespace'
alias kgcrev='kubectl get controllerrevision'
alias kgcrevw='kubectl get controllerrevision --watch'
alias kgcrevn='kubectl get controllerrevision --namespace'
alias kgcrevnw='kubectl get controllerrevision --watch --namespace'
alias kgcreva='kubectl get controllerrevision --all-namespaces'
alias kgcrevaw='kubectl get controllerrevision --all-namespaces --watch'
alias kecrev='kubectl edit controllerrevision'
alias kecrevn='kubectl edit controllerrevision --namespace'
alias kdcrev='kubectl describe controllerrevision'
alias kdcrevn='kubectl describe controllerrevision --namespace'
alias kdelcrev='kubectl delete controllerrevision'
alias kdelcrevn='kubectl delete controllerrevision --namespace'
#
# Resource Management
#
alias kgli='kubectl get limitrange'
alias kgliw='kubectl get limitrange --watch'
alias kglin='kubectl get limitrange --namespace'
alias kglinw='kubectl get limitrange --watch --namespace'
alias kglia='kubectl get limitrange --all-namespaces'
alias kgliaw='kubectl get limitrange --all-namespaces --watch'
alias keli='kubectl edit limitrange'
alias kelin='kubectl edit limitrange --namespace'
alias kdli='kubectl describe limitrange'
alias kdlin='kubectl describe limitrange --namespace'
alias kdelli='kubectl delete limitrange'
alias kdellin='kubectl delete limitrange --namespace'
alias kgqu='kubectl get resourcequota'
alias kgquw='kubectl get resourcequota --watch'
alias kgqun='kubectl get resourcequota --namespace'
alias kgqunw='kubectl get resourcequota --watch --namespace'
alias kgqua='kubectl get resourcequota --all-namespaces'
alias kgquaw='kubectl get resourcequota --all-namespaces --watch'
alias kequ='kubectl edit resourcequota'
alias kequn='kubectl edit resourcequota --namespace'
alias kdqu='kubectl describe resourcequota'
alias kdqun='kubectl describe resourcequota --namespace'
alias kdelqu='kubectl delete resourcequota'
alias kdelqun='kubectl delete resourcequota --namespace'
alias ktp='kubectl top pod'
alias ktn='kubectl top node'
#
# APIs and CRDs
#
alias kgapi='kubectl get apiservices.apiregistration.k8s.io'
alias kgapiw='kubectl get apiservices.apiregistration.k8s.io --watch'
alias kgcrd='kubectl get customresourcedefinitions.apiextensions.k8s.io'
alias kgcrdw='kubectl get customresourcedefinitions.apiextensions.k8s.io --watch'
#
# Canaries
#
alias kgcan='kubectl get canaries.flagger.app'
alias kgcanw='kubectl get canaries.flagger.app --watch'
alias kgcann='kubectl get canaries.flagger.app --namespace'
alias kgcannw='kubectl get canaries.flagger.app --watch --namespace'
alias kgcana='kubectl get canaries.flagger.app --all-namespaces'
alias kgcanaw='kubectl get canaries.flagger.app --all-namespaces --watch'
#
# Contexts and open-ended commands (used for items not included above)
#
alias kcuc='kubectl config use-context'
alias kcsc='kubectl config set-context'
alias kcdc='kubectl config delete-context'
alias kccc='kubectl config current-context'
alias kcgc='kubectl config get-contexts'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kdelf='kubectl delete -f'
alias kgpl='kgp -l'
alias kcn='kubectl config set-context $(kubectl config current-context) --namespace'
#
# Misc kubectl commands
#
alias kpf="kubectl port-forward"
alias kcp='kubectl cp'
alias kaf='safe_kubectlapply'
alias keit='kubectl exec -it'
#
# Rollout Restarts
#
alias krh='kubectl rollout history'
alias kru='kubectl rollout undo'
alias krsss='kubectl rollout status statefulset'
alias krrsts='kubectl rollout restart sts'
alias kga='kubectl get all'
alias kgaa='kubectl get all --all-namespaces'
#
# Logs
#
alias kl='kubectl logs'
alias kl1h='kubectl logs --since 1h'
alias kl1m='kubectl logs --since 1m'
alias kl1s='kubectl logs --since 1s'
alias klf='kubectl logs -f'
alias klf1h='kubectl logs --since 1h -f'
alias klf1m='kubectl logs --since 1m -f'
alias klf1s='kubectl logs --since 1s -f'


