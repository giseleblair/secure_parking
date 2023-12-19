<section class="deals-listing">
   <div class="wrapper">
      <h1>{{this.title}}</h1>
      {{ $type = {get_var.type} }}
      <div class="account-form__item">
         <select name="offer-event" id="offer-event" onchange="location = this.value;" style="max-width: 40rem;">
            <option value="" disabled="" selected="" hidden="">{{ if {$type} === ""}} Select type {{ else }} {{ $type }} {{ end-if }}</option>
            <option value="{{ page.getUrl() }}?type=All">Show All</option>
            <option value="{{ page.getUrl() }}?type=Offer">Offers</option>
            <option value="{{ page.getUrl() }}?type=Event">Events</option>
         </select>
      </div>
      <div class="deals-listing__container">
         {{ $show = {this.show} }} 
         {{ if {get_var.p} }} 
         {{ $show = {math({$show} + {get_var.p})} }} 
         {{ end-if }} 
         {{ each offer_item as dealsCounter where dealsCounter.parent_zuid = '{page.zuid}'}} {{ $totalSize = {dealsCounter._length} }} {{ end-each }} 
         {{ if {$type} === "" or {$type} === 'All' }} 
         {{ each offer_item as deals where deals.parent_zuid = '{page.zuid}' limit {$show} order by deals.sort }}
         <a class="deals-listing__anchor" href="{{deals.getUrl()}}">
            <div class="deals-listing__item">
               <div class="deals-listing__img-wrapper">
                  {{if {deals.deal_image.getImage()} != ''}}
                  <picture>
                     <source srcset="{{deals.deal_image.getImage()}}?width=700&crop=1:1" media="(max-width: 599px)" />
                     <source srcset="{{deals.deal_image.getImage()}}?width=1400&crop=1:1" media="(min-width: 600px)" />
                     <img src="{{deals.deal_image.getImage()}}?width=700&crop=1:1" />
                  </picture>
                  {{end-if}}
               </div>
               <div class="deals-listing__content-wrapper">
                  <h2 class="item-title">{{deals.title}}</h2>
               </div>
            </div>
         </a>
         {{ $currentSize = {deals._length} }} 
         {{ end-each }}
         {{ else }}
         {{ each offer_item as deals where deals.offer_or_event = '{$type}' and deals.parent_zuid = '{page.zuid}' limit {$show} order by deals.sort }}
         <a class="deals-listing__anchor" href="{{deals.getUrl()}}">
            <div class="deals-listing__item">
               <div class="deals-listing__img-wrapper">
                  {{if {deals.deal_image.getImage()} != ''}}
                  <picture>
                     <source srcset="{{deals.deal_image.getImage()}}?width=700&crop=1:1" media="(max-width: 599px)" />
                     <source srcset="{{deals.deal_image.getImage()}}?width=1400&crop=1:1" media="(min-width: 600px)" />
                     <img src="{{deals.deal_image.getImage()}}?width=700&crop=1:1" />
                  </picture>
                  {{end-if}}
               </div>
               <div class="deals-listing__content-wrapper">
                  <h2 class="item-title">{{deals.title}}</h2>
               </div>
            </div>
         </a>
         {{ $currentSize = {deals._length} }} 
         {{ end-each }}
         {{ end-if }}
      </div>
   </div>
   {{ if {$totalSize} > {$currentSize} }}
   <div class="wrapper text-center">
      <div class="primary-btn">
         <a href="{{ page.getUrl() }}?p={{$show}}">Show More</a>
      </div>
   </div>
   {{ end-if }}
</section>