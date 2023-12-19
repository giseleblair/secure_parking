<section class="search-filters">
   <div class="search-filters__container">
      <div class="search-filters__header">
         <div class="search-filters__title">
            <span></span>Filters
         </div>
         <div class="search-filters__clear-all">Clear All <span style="background-image: url('https://24twnq5l.media.zestyio.com/grey-close-sign.svg')"></span></div>
      </div>
      <div class="search-filters__checkbox-group">
         {{ each moq_service_setting as filters }}
         {{ each moq_service as service where find_in_set(service.zuid, '{filters.moq_services}') order by service.sort ASC }} 

            {{ $name = {service.display_name} }}
            {{if {service.display_name} == ''}}
               {{ $name = {service.name} }}
            {{ end-if }}
            
         <div class="search-filters__item search-filters__item--checkbox">
            <label class="custom-checkbox-sp" > {{ $name }}
            <input id="{{ service.moqid }}" type="checkbox" name="{{ $name }}">
            <span class="checkmark"></span>
            </label>
         </div>
         {{ end-each }}
         {{ end-each }}
      </div>
   </div>
</section>
<div class="search-filters__overlay"> </div>