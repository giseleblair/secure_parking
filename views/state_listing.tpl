(** default code https://zesty.org/services/web-engine/introduction-to-parsley/parsley-autolayout **)
{{ include _envlang }}
{{if {$langPrefix} === '/en-au' }}
    {{response.redirect302(https://www.secureparking.com.au/en-au/car-park-rates/)}}
{{else}}
    {{response.redirect302(https://www.secureparking.co.nz/en-nz/car-park-rates/)}}
{{end-if}}