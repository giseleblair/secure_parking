

<div class="wrapper">
   {{ each user_preference_setting as pref_settings where pref_settings.title = "Preferences"}}
   {{if {this.set_zuid} == {$userPreferencesPageId} }}
         <h1 class="account-preferences__main-title">{{pref_settings.title}} </h1>
   {{else}}                            
         <h2 class="account-preferences__main-title">{{pref_settings.title}} </h2>
   {{end-if}}
   
   <div class="account-preferences__items opt-out">
      {{ each user_preference as preference where find_in_set(preference.zuid, '{pref_settings.user_prefs}') order by preference.sort ASC }}  
      <div class="account-preferences__item">
         <div class="account-preferences__info">
            <div class="account-preferences__title">{{preference.display_name}}</div>
            <div class="account-preferences__desc">{{preference.description}}</div>
         </div>
         <div class="account-preferences__switch">
            <label class="switch">
            <input type="checkbox" name="{{preference.value}}">
            <span class="slider round"></span>
            </label>
         </div>
      </div>
      {{end-each}}
   </div>
   {{end-each}}
</div>
<div class="bg-white">
   <div class="wrapper">
   {{ each moq_service_setting as filters }}
   <h2>{{filters.title}} </h2>
   <div class="account-preferences__items search-filters-preferences">
      {{ each moq_service as service where find_in_set(service.zuid, '{filters.moq_services}') order by service.sort ASC }}  
        
         {{ $name = {service.display_name} }}
            {{if {service.display_name} == ''}}
               {{ $name = {service.name} }}
            {{ end-if }}

      <div class="account-preferences__item">
         <div class="account-preferences__info">
            <div class="account-preferences__title">{{$name}}</div>
            <div class="account-preferences__desc">{{service.description}}</div>
         </div>
         <div class="account-preferences__switch">
            <label class="switch">
            <input type="checkbox" name="{{$name}}" id="{{service.moqid}}">
            <span class="slider round"></span>
            </label>
         </div>
      </div>
      {{end-each}}
   </div>
   {{end-each}}
   <div class="account-preferences__update-wrapper">
      {{ include /misc/loader }}
      <div class="cta-full account-preferences__update">Update preferences</div>
   </div>
   </div>
</div>
