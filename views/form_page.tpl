{{ include _envlang }}
{{if {instance.current_lang.code} == en-au }}
    {{ $domain = https://www.secureparking.com.au }}
{{else}}
    {{ $domain = https://www.secureparking.co.nz }}
{{end-if}}
{{ $thankyou = {truepath({this.thank_you_page})} }}
{{ $redirect = {$domain}{$thankyou} }}
{{ $formUrl = {truepath({this.zuid})} }}
 <div class="form-wrapper">
    <div class="wrapper">
        <div class="form-intro">
            {{ this.content_above_form.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1) }}
        </div>

        {{if {post_var.submitted} }}
            {{ if {this.thank_you_page} }}     
                {{ response.redirect302({$redirect}) }}
            {{ else }}
                {{ this.thank_you_message.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1)  }}
            {{ end-if }}        
        {{ else }}
            {{ each form as form_element where form_element.zuid = '{this.form}' }}  
                <form class="form-page" method="post" action="{{$formUrl}}">
                    {{ each form_fields as ff where find_in_set(ff.zuid, '{form_element.fields}') order by ff.sort ASC }}
                        {{ $labelClass = "" }}
                        {{ $spanClass = "" }}
                        {{ $required = "" }}
                        {{ $pattern = "" }}
                        {{ $field = input }}
                        {{ $type = {ff.field_type} }}
                        {{ $autocomplete = {ff.field_type} }}
                        {{ $class = form-page__item  form-page__item--desktop-half }}

                        {{ if ({ff.full_page} === "" || {ff.full_page} === 1) }}
                            {{ $class = form-page__item }}
                        {{ end-if }}
                        {{ if {ff.field_type} === "checkbox" }}
                            {{ $class = form-page__item form-page__item--checkbox }}
                        {{ end-if }}
                        {{ if {ff.field_type} === "radio" }}
                            {{ $class = form-page__item form-page__item--radio }}
                        {{ end-if }}  
                        
                        {{ if {ff.field_type} === "text" }}
                            {{ $autocomplete = on }}
                        {{ end-if }}

                        {{ if ({ff.field_type} === "hidden" || {ff.field_type} === "checkbox" || {ff.field_type} === "radio" || {ff.field_type} === "select" || {ff.field_type} === "textarea") }}
                            {{ $field = {ff.field_type} }}
                        {{ end-if }}   

                        {{ if {ff.required} == 1 }}
                            {{ $required = required }}                    
                        {{ end-if }}     

                        {{ if {ff.regex} !== ""}}
                            {{ $pattern = pattern='{ff.regex}' }}
                        {{ end-if}}

                        {{ if {$field} === "hidden" }}
                            <input type="{{$type}}" value="{{ ff.value }}{{ request.queryParam({ff.query_string_name}) }}" />
                        {{else}}
                            {{ if {$field} === "checkbox" }}
                                {{ $labelClass = custom-checkbox-sp }}
                                {{ $spanClass = checkmark}}
                            {{ end-if }}
                            {{ if {$field} === "radio" }}
                                {{ $labelClass = custom-radio-sp }}
                                {{ $spanClass = radiomark}}                            
                            {{ end-if }}                             

                        <div class="{{ $class }} {{ ff.field_class }}">
                            {{ if ({$field} != checkbox || {$field} != radio || {ff.value} != "") }}                                
                                <label title="{{field.label}}" class="{{$required}}">{{ff.label}}</label>
                            {{ end-if }}
                            {{ if {$field} === "input" }}
                                <input type="{{$type}}" {{ ff.attributes }} placeholder="{{ ff.default_value }}" name="{{ ff.name }}" autocomplete="{{$autocomplete}}" {{$required}} {{$pattern}} value="{{ request.queryParam({ff.query_string_name}) }}"/>
                            {{ end-if }}
                            {{ if {$field} === "textarea" }}
                                <textarea name="{{ ff.name }}" placeholder="{{ ff.default_value }}" {{$required}} pattern="{{ ff.regex}}" value="{{ request.queryParam({ff.query_string_name}) }}"></textarea>
                            {{ end-if }}                    

                            {{ if {$field} === "select" }}
                                {{ $qs = {request.queryParam({ff.query_string_name})} }}
                                <select name="{{ ff.name }}" placeholder="{{ ff.default_value }}" {{$required}} {{if {ff.is_multiple_select} }} multiple{{end-if}}>
                                    <option value="" disabled  {{if {select.value} === {$qs} }} selected{{end-if}}  hidden>Select</option>
                                    {{ each select_option as select where find_in_set(select.zuid, '{ff.select_options}') order by select.sort ASC}}
                                    <option value="{{ select.value }}" {{if {select.value} === {$qs} }} selected{{end-if}}>{{ select.label }}</option>
                                    {{ end-each }}
                                </select>
                            {{ end-if }}
                       
                            {{ if ({$field} === "checkbox" || {$field} === "radio") }}
                                <label class="{{$labelClass}}">{{ ff.value }}
                                    <input type="{{$type}}" name="{{ ff.name }}" {{ ff.attributes }} {{$required}}/>
                                    <span class="{{$spanClass}}"></span>
                                </label>           
                            {{ end-if }}

                            {{ if {$field} === "inputdate"}}
                                <input type="{{$type}}" />
                            {{ end-if }}

                            <p class="help-text">{{ff.help_text_long}}</p>
                            <span class="error" data-error-for="{{ ff.name }}"></span>
                        </div>   
                        {{ end-if }}
                    {{ end-each }}

                    <div class="form-page__item  submit">
                        <button class="cta-full" type="submit">Submit</button>   
                    </div>
                    (** This field is used as a honeypot please do not remove **)
                    <input type="hidden" name="workemail" value="" />
                    <input type="hidden" name="submitted" value="true" />
                    <input type="hidden" name="zlf" value="{{ form.name }} - {{ page.seo_meta_title }}" />
                    <input type="hidden" name="email_override" value="{{ page.recipient_email_address }}" />
                    <input type="hidden" name="email_subject" value="{{ page.email_subject }}" />
                    <input type="hidden" name="_zesty_webhook" value="https://spa-fa-web-proxy-prd-ae.azurewebsites.net/customers/sendemail">
                </form>
            {{ end-each }}
            <div>
                {{ this.content_below_form.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1)  }}
            </div>
        {{end-if}}
    </div>
</div>