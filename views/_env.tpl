{{ $AdvamPaymentGateway = https://gateway.api.advam.com/webbank/webbank-js/js/v2/webbank.js}}
{{ $AdvamPaymentGatewayCss = https://gateway.api.advam.com/webbank/webbank-js/css/hosted-fields.css}}
{{ $domain = {instance.domain} }}

{{ $SpaFaWebProxy = https://spa-fa-web-proxy-prd-ae.azurewebsites.net }}
{{ if {$domain} == "voyagerbuild.zesty.dev" or {$domain} == "24twnq5l-dev.webengine.zesty.io" }}
    {{ $SpaFaWebProxy = https://spa-fa-web-proxy-dev-ae.azurewebsites.net}}
    {{ $moqServiceSetting = 8b4a384c-4562-4b93-84dc-2f638cbeb818 }}
    {{ $bookingPageId = 6-8ecfdedb98-1mjpcd }}
    {{ $accountPageId = 6-e6c7bfe0f6-1pn71j }}
    {{ $personalDetailsPageId = 6-b689b3a293-nw5v1s }}
    {{ $userPreferencesPageId = 6-ecc99aee8f-t33d0x }}
    {{ $addNewVehiclePageId = 6-acb2c9aaff-088q8b }}
    {{ $paymentMethodsPageId = 6-defee2c9b7-vttln9 }}
    {{ $cartPageId = 6-84b8e1908b-nsn5g3 }}    
    
    {{ $langPrefix }}
{{else}}
    {{ $moqServiceSetting = 5a90f71b-c0f4-4b76-b7cd-4e62fa378d69 }}
    {{ $bookingPageId = 6-9695ae909f-gsbbsg }}
    {{ $accountPageId = 6-8afab0befa-z4grr5 }}
    {{ $personalDetailsPageId = 6-baf3f5f7fd-8np13w }}
    {{ $userPreferencesPageId = 6-f09f90f48a-k05np0 }}
    {{ $addNewVehiclePageId = 6-c8bfadb5b9-5m30j8 }}
    {{ $paymentMethodsPageId = 6-c4f58586f5-1zm6s2 }}
    {{ $cartPageId = 6-e6b092cbd6-fp21fx }}
{{end-if}}
{{ if {$domain} == "voyageruat.zesty.dev" or {$domain} == "tzmhv269-dev.webengine.zesty.io" }}
    {{ $SpaFaWebProxy = https://spa-fa-web-proxy-uat-ae.azurewebsites.net }}    
    {{ $langPrefix }}
{{end-if}}
{{ if {$domain} == "voyagerpreprod.zesty.dev" or {$domain} == "1xdz3j0p-dev.webengine.zesty.io" }}
   {{ $SpaFaWebProxy = https://spa-fa-web-proxy-preprd-ae.azurewebsites.net}}   
    {{ $langPrefix }}
{{end-if}}
{{ if {$domain} == "voyagerbeta.zesty.dev"  or {$domain} == "gj9bffxd-dev.webengine.zesty.io" }}
    {{ $SpaFaWebProxy = https://spa-fa-web-proxy-beta-ae.azurewebsites.net}}    
    {{ $langPrefix }}
{{end-if}}

{{ if {$domain} == "www.secureparking.co.nz" or {$domain} == "www.secureparking.com.au" or {$domain} == "voyagerbeta.zesty.dev" or {$domain} == "gj9bffxd-dev.webengine.zesty.io" or {$domain} == "voyagerprod.zesty.dev" or {$domain} == "d1dxkf4q-dev.webengine.zesty.io" }}
    {{ $langPrefix = /{instance.current_lang.code} }}
    {{ $AdvamPaymentGateway = https://gateway.api.advam.com/webbank/webbank-js/js/v2/webbank.js }}
    {{ $AdvamPaymentGatewayCss = https://gateway.api.advam.com/webbank/webbank-js/css/hosted-fields.css}}
{{end-if}}