{{ include /_custom/seo/jsonLdProduct.html  }}
{{ include _env }}

{{ each moq_carpark_details as carparkDetail where carparkDetail.zuid = '{this.moq_details}' }}
    {{ $maxPrice = 0 }}
    {{ $minPrice = 9999 }}
    {{ $latitude = {carparkDetail.latitude} }}
    {{ $longitude = {carparkDetail.longitude} }}
    {{ $carparkId = {carparkDetail.moqid} }}
    {{ $carparkState = {carparkDetail.address_state} }}
    {{ $carparkName = {carparkDetail.name} }}
    {{ $carparkBookingFee = {carparkDetail.booking_fee} }}
    {{ each moq_product_details as product where find_in_set(product.zuid, '{carparkDetail.products}') }}
        <!--{{product.zuid}} -->
        {{ each moq_rate_details as rate where find_in_set(rate.zuid, '{product.rates}') }}
            {{ each moq_configuration_details as config where find_in_set(config.zuid, '{rate.configurations}') }}
                {{ each moq_tier_details as tier where find_in_set(tier.zuid, '{config.tiers}') }}      
                      {{ if {tier.pre_book_rate} != -1 }}
                      {{ $prebookAddFee = {math( {tier.pre_book_rate} + {$carparkBookingFee} )} }}
                      {{ end-if }}                  
                    {{ if {$prebookAddFee} > {$maxPrice} }}
                        {{ $maxPrice = {$prebookAddFee} }} 
                    {{ end-if }} 
                    {{ if {tier.drive_up_rate} > {$maxPrice} }}                         
                        {{ $maxPrice = {tier.drive_up_rate} }} 
                    {{ end-if }} 
                    {{ if {$minPrice} > {$prebookAddFee} && {tier.pre_book_rate} != -1 }}
                        {{ $minPrice = {$prebookAddFee} }}  
                    {{ end-if }} 
                    {{ if {$minPrice} > {tier.drive_up_rate} && {tier.drive_up_rate} != -1  }}
                        {{ $minPrice = {tier.drive_up_rate} }}  
                    {{ end-if }} 
                {{end-each}} 
            {{end-each}}
        {{end-each}}    
    {{end-each}}


{{ if {instance.domain} == "24twnq5l-dev.webengine.zesty.io" or {instance.domain} == "tzmhv269-dev.webengine.zesty.io"  or {instance.domain} == "1xdz3j0p-dev.webengine.zesty.io" or {instance.domain} == "gj9bffxd-dev.webengine.zesty.io" or {instance.domain} == "d1dxkf4q-dev.webengine.zesty.io"}}
    <section class="author-tools" style="text-align:center;padding:5px; border: 1px solid #0055a5">Authors Only<br />
    <a id="carpark-import" href="#" style="font-weight:bold; color: #0055a5; text-decoration: underline;" class="grey-section__title"> Click here to force the update process to be run against {{this.title}}</a></section>
    <script>
        document.querySelector('#carpark-import').addEventListener("click", async function(){
            
            const response = await fetch("{{$SpaFaWebProxy}}/update/carpark", {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                body: `{
                    "carParkId": "{{$carparkId}}",
                    "carParkPageZuid": "{{this.zuid}}",
                    "carParkDetailsZuid": "{{this.moq_details}}",
                }`,
            }).then(function(response) {
                if(!response.ok) {
                alert("Unable to run import for {{this.title}}. Try again");
                }
                return response.status
            }).then(function(result) {
                if(result !== 204) {
                    alert("Unable to run import for {{this.title}}. Try again");
                }
                alert("Car park import is running for {{this.title}}");
            }).catch(function(err) {
                alert("Unable to run import for {{this.title}}. Try again");
            });
        });
    </script>
{{end-if}}

<section class="car-park-detail">
    <div class="car-park-detail__left">
         <div class="grey-section bg-secondary">
            <div class="wrapper-map-left">
                <p class="grey-section__title">Find a car park</p>
                <section class="search-park-input">

                    <div class="search-park-input__search">
                        <span class="search-park-input__search-icon active"></span>
                        <input placeholder="Find a Park" class="find-park-input" data-context="carparkpage">
                        <div class="search-park-input__filters-wrapper">
                        <span class="search-park-input__filters"></span>
                        <span class="search-park-input__number"></span>
                        </div>
                        <div class="search-park-input__summary">
                            <div class="date"></div>
                            <div class="duration"></div>
                        </div>
                    </div>
                    <section class="parks-results active" data-searchshowid="autocomplete-results-desktop">
                        <div class="loader parks text-center" style="display:none">
                            <div class="lds-ripple">
                                <div></div>
                                <div></div>
                            </div>
                        </div>
                        <section class="content-search-results--all-parks search-widget__results homepage-banner__search-results">
                            <div class="loader find-park text-center" style="display: none;">
                                <div class="lds-ripple">
                                    <div></div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="search-widget__container" data-context="carparkpage">
                                <div class="items">
                                    <div class="geocode-results">
                                    </div>
                                    <div class="carpark-results-container">
                                    </div>
                                    <div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="search-widget__results" style="display:none; position: absolute; left: 0; top: 174px;">
                            <div class="loader parks-mobile" style="">
                                <div class="lds-ripple">
                                    <div></div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="search-widget__container active" data-context="carparkpage">
                                <div class="items">
                                    <div class="geocode-results">
                                    </div>
                                </div>
                            </div>
                        </section>
                    </section>
                </section>
            </div>
        </div>
        <div class="wrapper-map-left wrapper-map-left--mobile">
            <div class="car-park-detail__info">              
                {{ $hasImage = 0 }}
                {{if {this.carpark_image.getImage()} != ''}}{{$hasImage = 1}}{{end-if}}
                    {{ $defaultEntrance = {carparkDetail.entry_street} }} 
                    {{ $defaultDescription = {carparkDetail.entry_street} }}
                    {{ $defaultImage = {this.carpark_image.getImage()} }}
                    {{ $defaultLatitude = {carparkDetail.latitude} }} 
                    {{ $defaultLongitude = {carparkDetail.longitude} }} 
                {{ each moq_entrance as entrance where find_in_set(entrance.zuid, '{carparkDetail.entrances}') sort by name limit 1}}
                    {{ $defaultEntrance = {entrance.name} }}
                      {{if {entrance.description} != ''}} 
                        {{  $defaultDescription = {entrance.description} }}
                        {{else}}
                        {{  $defaultDescription  = {entrance.name} }}
                        {{end-if}}
                    {{ $defaultLatitude = {entrance.latitude} }} 
                    {{ $defaultLongitude = {entrance.longitude} }} 
                     {{if {entrance.image.getImage()} != ''}}{{ $defaultImage = {entrance.image.getImage()} }}{{ $hasImage = 1 }} {{end-if}}                    
                {{ end-each}}
                {{ $mapClass = '' }}
                {{if {$hasImage} == 1}}
                {{ $mapClass = hidden }}
                    <div class="car-park-detail__img car-park-detail__img--photo">
                        <div class="car-park-detail__img-wrapper">
                    
                        <img src="{{ $defaultImage }}?width=1050" alt="{{ $defaultEntrance }}">
                    
                        </div>
            
                    </div>
                {{ end-if }}
                <div class="car-park-detail__img car-park-detail__img--map {{ $mapClass }}">
                    <div class="car-park-detail__img-wrapper">
                 
                        <img data-img="https://maps.googleapis.com/maps/api/staticmap?center={{$defaultLatitude}},{{$defaultLongitude}}&scale=2&zoom=16&size=640x640&style=feature:poi|visibility:off&markers=anchor:50,64|icon:https://d1dxkf4q.media.zestyio.com/pin-online-p.png?width=48|{{$defaultLatitude}},{{$defaultLongitude}}&key=AIzaSyBd09P3v5BMSE4tkl6kgv7qJZGsGYV0mD0" />
                 
                    </div>
                </div>

                 <div class="car-park-detail__entrance">
                    <div class="car-park-detail__entrance-item upper" id="dropdownMenuButton1">                    
                     {{ $defaultDescription }}
                    </div>
                    <ul class="dropdown-content" aria-labelledby="dropdownMenuButton1">

                         {{ each moq_entrance as entrance where find_in_set(entrance.zuid, '{carparkDetail.entrances}') sort by name }}
                        
                        {{if {entrance.description} != ''}} 
                        {{   $desc = {entrance.description} }}
                        {{else}}
                        {{   $desc = {entrance.name} }}
                        {{end-if}}

                         {{if {entrance.image.getImage()} != ''}}{{$hasImage = 1}}{{end-if}}
                            <li class="car-park-detail__entrance-item li" data-latitude="{{entrance.latitude}}" data-longitude="{{entrance.longitude}}"
                            data-image="{{entrance.image.getimage()}}">
                                {{$desc}}
                            </li>
                        {{ end-each}}
                    </ul>

                </div>
                {{if {$hasImage} === 1}}
                    <div class="car-park-detail__tabs">
                        <div class="car-park-detail__tab-item photo active">
                            Photo
                        </div>
                        <div class="car-park-detail__tab-item map">
                            Map
                        </div>
                    </div>
                {{end-if}}
            </div>
            <div class="wrapper-map-left">
                <div class="car-park-detail__content">
                    <div class="car-park-detail__logo"><img src='https://d1dxkf4q.media.zestyio.com/logo-marketing.svg'></div>
                    <h1>{{this.title}}</h1>
                    <div class="car-park-detail__address">{{carparkDetail.address_street}}, {{carparkDetail.address_suburb}} {{carparkDetail.address_state}} {{carparkDetail.address_postcode}}</div>
                    <div class="car-park-detail__distance">
                        {{carparkDetail.maximum_height.number_format(2)}}m
                    </div>
                    {{if {this.description} != ""}}
                    <div class="car-park-detail__description">{{this.description.replace(href="(?!(http|mailto|tel)).*?,  href="{$langPrefix}$1) }}</div>
                    {{ end-if}}
                    {{ each moq_service as service where find_in_set(service.zuid, '{carparkDetail.available_services}') }}
                    {{ if 0 != {service._length} }}
                    {{ if {service._num} == 1 }}<h2>Car park features</h2>
                    <ul>
                    {{end-if}}
                        <li>{{service.name}}</li>                        
                    {{ if {service._num} == {service._length} }}
                    </ul>
                    {{end-if}}
                    {{end-if}}
                    {{end-each}}
                    <div class="car-park-detail__accordion">
                        {{if {carparkDetail.entry_instructions} != ""}}
                            <div class="car-park-detail__accordion-item">
                                <div class="car-park-detail__accordion-wrapper">
                                    <div class="car-park-detail__accordion-item-title">Entry information</div>
                                </div>

                                <div class="car-park-detail__accordion-subitem">
                                    <!-- Design to be confirmed --> 
                                    <div>{{carparkDetail.entry_instructions}}</div>                        
                                </div>
                            </div>
                        {{end-if}}
                         {{if {carparkDetail.exit_instructions} != ""}}
                            <div class="car-park-detail__accordion-item">
                                <div class="car-park-detail__accordion-wrapper">
                                    <div class="car-park-detail__accordion-item-title">Exit information</div>
                                </div>

                                <div class="car-park-detail__accordion-subitem">
                                    <!-- Design to be confirmed --> 
                                    <div>{{carparkDetail.exit_instructions}}</div>                         
                                </div>
                            </div>
                        {{end-if}}
                        <div class="car-park-detail__accordion-item">
                            <div class="car-park-detail__accordion-wrapper">
                                <div class="car-park-detail__accordion-item-title"><h2 class="opening-hours">Opening Hours</h2></div>
                                {{if {carparkDetail.sunday_opening_hours} == "24 Hours" && {carparkDetail.monday_opening_hours} == "24 Hours" && {carparkDetail.tuesday_opening_hours} == "24 Hours" && {carparkDetail.wednesday_opening_hours} == "24 Hours" && {carparkDetail.thursday_opening_hours} == "24 Hours" && {carparkDetail.friday_opening_hours} == "24 Hours" && {carparkDetail.saturday_opening_hours} == "24 Hours" && {carparkDetail.public_holiday_opening_hours} == "24 Hours"  }}
                                    <div class="car-park-detail__accordion-item-add">24 Hours</div>
                                {{end-if}}
                                {{if {carparkDetail.sunday_opening_hours} == "Closed" && {carparkDetail.monday_opening_hours} == "Closed" && {carparkDetail.tuesday_opening_hours} == "Closed" && {carparkDetail.wednesday_opening_hours} == "Closed" && {carparkDetail.thursday_opening_hours} == "Closed" && {carparkDetail.friday_opening_hours} == "Closed" && {carparkDetail.saturday_opening_hours} == "Closed" && {carparkDetail.public_holiday_opening_hours} == "Closed"  }}
                                    <div class="car-park-detail__accordion-item-add">Closed</div>
                                {{end-if}}
                            </div>
                            <div class="car-park-detail__accordion-subitem">
                                <!-- Design to be confirmed, grouping of these details tbd --> 
                                <div class="general dates-group">
                                    {{if {carparkDetail.monday_closing_hours} == ""}}
                                        <div><span class="day">Monday</span><span>{{carparkDetail.monday_opening_hours}}</div>
                                    {{else}}
                                        <div><span class="day">Monday</span><span>{{carparkDetail.monday_opening_hours}}&nbsp;-&nbsp;{{carparkDetail.monday_closing_hours}}</span></div>
                                    {{end-if}}
                                    {{if {carparkDetail.tuesday_closing_hours} == ""}}
                                        <div><span class="day">Tuesday</span><span>{{carparkDetail.tuesday_opening_hours}}</span></div>
                                    {{else}}
                                        <div><span class="day">Tuesday</span><span>{{carparkDetail.tuesday_opening_hours}}&nbsp;-&nbsp;{{carparkDetail.tuesday_closing_hours}}</span></div>
                                    {{end-if}}
                                    {{if {carparkDetail.wednesday_closing_hours} == ""}}
                                        <div><span class="day">Wednesday</span><span>{{carparkDetail.wednesday_opening_hours}}</span></div>
                                    {{else}}
                                        <div><span class="day">Wednesday</span><span>{{carparkDetail.wednesday_opening_hours}}&nbsp;-&nbsp;{{carparkDetail.wednesday_closing_hours}}</span></div>
                                    {{end-if}}
                                    {{if {carparkDetail.thursday_closing_hours} == ""}}
                                        <div><span class="day">Thursday</span><span>{{carparkDetail.thursday_opening_hours}}</span></div>
                                    {{else}}
                                        <div><span class="day">Thursday</span><span>{{carparkDetail.thursday_opening_hours}}&nbsp;-&nbsp;{{carparkDetail.thursday_closing_hours}}</span></div>
                                    {{end-if}}
                                    {{if {carparkDetail.friday_closing_hours} == ""}}
                                        <div><span class="day">Friday</span><span>{{carparkDetail.friday_opening_hours}}</span></div>
                                    {{else}}
                                        <div><span class="day">Friday</span><span>{{carparkDetail.friday_opening_hours}}&nbsp;-&nbsp;{{carparkDetail.friday_closing_hours}}</span></div>
                                    {{end-if}}
                                    {{if {carparkDetail.saturday_closing_hours} == ""}}
                                        <div><span class="day">Saturday</span><span>{{carparkDetail.saturday_opening_hours}}</span></div>
                                    {{else}}
                                        <div><span class="day">Saturday</span><span>{{carparkDetail.saturday_opening_hours}}&nbsp;-&nbsp;{{carparkDetail.saturday_closing_hours}}</span></div>
                                    {{end-if}}
                                    {{if {carparkDetail.sunday_closing_hours} == ""}}
                                        <div><span class="day">Sunday</span><span>{{carparkDetail.sunday_opening_hours}}</span></div>
                                    {{else}}
                                        <div><span class="day">Sunday</span><span>{{carparkDetail.sunday_opening_hours}}&nbsp;-&nbsp;{{carparkDetail.sunday_closing_hours}}</span></div>
                                    {{end-if}}
                                    {{if {carparkDetail.public_holiday_closing_hours} == ""}}
                                        <div><span class="day">Public Holidays</span><span>{{carparkDetail.public_holiday_opening_hours}}</span></div>
                                    {{else}}
                                        <div><span class="day">Public Holidays</span><span>{{carparkDetail.public_holiday_opening_hours}}&nbsp;-&nbsp;{{carparkDetail.public_holiday_closing_hours}}</span></div>
                                    {{end-if}}
                                </div>                            
                            </div>
                        </div>
                    </div>
                    <div class="car-park-detail__accordion car-park-detail__rates-services">
                        <h2>Parking Services</h2>
                            
                    {{ each moq_product_details as product where find_in_set(product.zuid, '{carparkDetail.products}') }}
                    {{ $productName = {product.name} }}  
                    {{ $productDescription = {product.description} }}
                    {{ $category = {product.category} }}  
                                                    					
    
                        <!-- get lowest online pricing from all products -->
                            {{ $isSpecialDay = false }}  
                            {{ each moq_rate_details as rate where find_in_set(rate.zuid, '{product.rates}') }}
                            {{ $rateName = {rate.name} }}
                     
                                {{ $minProductPrice = 9999 }}
								{{ each moq_configuration_details as config where find_in_set(config.zuid, '{rate.configurations}') }}
                                    
                                    {{ $isMulti = {config.is_multi_entry} }}
                                      {{ if ({$isSpecialDay} && {config.usage_days} == "SpecialDay") }}
                                        {{ $isSpecialDay = true }}
                                    {{ end-if }}
                              
                                    {{ each moq_tier_details as tier where find_in_set(tier.zuid, '{config.tiers}') }}
                                   
                                        {{ if {tier.pre_book_rate} != -1 }}
                                        {{ $prebookPlusFee = {math( {tier.pre_book_rate} + {$carparkBookingFee} )} }}
                                        {{ end-if }}
                                    
                                        {{ if {$minProductPrice} > {$prebookPlusFee} && {tier.pre_book_rate} != -1 }}
                                            {{ $minProductPrice = {$prebookPlusFee} }}  
                                        {{ end-if }} 
                                        {{ if {$minProductPrice} > {tier.drive_up_rate} && {$isMulti} != 1 && {tier.drive_up_rate} != -1 }}
                                            {{ $minProductPrice = {tier.drive_up_rate} }}  
                                        {{ end-if }} 
                                        {{ if {tier.pre_book_rate} == -1 && {tier.drive_up_rate} == -1 }}
                                            {{ $minProductPrice = -1 }}  
                                        {{ end-if }} 
                                    {{end-each}}

                            
                                {{end-each}}

                                <!-- isMulti = {{$isMulti}}  -->

                                {{ $accTitle = "" }}
                             
                                {{ if {$isSpecialDay} == 'true' }}
                                {{ $accTitle = {$rateName} }}
                                {{ else }}
                                 {{ $accTitle = {$productName} }}
                                {{end-if }}

                                {{ $validFrom = {rate.valid_from.date(Y-m-d)} }}

                                <div class="car-park-detail__accordion-item"
                                    data-ecomm-trigger='view'
                                    data-ecomm-name-and-id="{{ $carparkName }}, {{$category}}" 
                                    data-ecomm-brand="{{ $carparkName}}" 
                                    data-ecomm-category="{{$category}}"
                                    data-item-list-name="Car park page"
                                    data-valid-from="{{rate.valid_from.date(Y-m-d)}} 00:00:00"
                                    data-valid-to="{{rate.valid_to.date(Y-m-d)}} 23:59:59"
                                    data-is-special-day="{{$isSpecialDay}}"
                                  >  

                                    <div class="car-park-detail__accordion-wrapper">
                                        <div class="car-park-detail__accordion-item-title">
                                       {{ $accTitle }}
                                        </div>
                                        {{ if {$minProductPrice} != 9999}}
                                            <div class="car-park-detail__accordion-item-add">
                                                <span>From</span> ${{ $minProductPrice.number_format(2) }}
                                            </div>
                                        {{ end-if }}
                                    </div>
                                    <div class="car-park-detail__accordion-subitem">
                                        <div>{{$productDescription}}</div>
                                    {{ each moq_configuration_details as config where find_in_set(config.zuid, '{rate.configurations}') }}
                                  
                                

                                            <div class="general">
                                                <div><span>Available</span> {{config.usage_days_display}}</div>
                                                 {{ if {config.entry_end_time} == '' }}
                                                    <div><span>Enter</span> after {{config.entry_start_time.date(h:i A)}}</div>
                                                {{ else }}
                                                    <div><span>Enter</span> between {{config.entry_start_time.date(h:i A)}} - {{config.entry_end_time.date(h:i A)}}</div>
                                                {{ end-if }}
                                                {{ if {config.exit_start_time} == '' }}
                                                    <div><span>Exit</span> before {{config.exit_end_time.date(h:i A)}} {{ if {config.exit_end_next_day} }} the next day{{end-if}}</div>
                                                {{ else }}
                                                    <div><span>Exit</span> between {{config.exit_start_time.date(h:i A)}} - {{config.exit_end_time.date(h:i A)}}{{ if {config.exit_end_next_day} }} the next day{{end-if}}</div>
                                                {{ end-if }}
                                            </div>
                                            {{ each moq_tier_details as tier where find_in_set(tier.zuid, '{config.tiers}') sort by tier.range_from }}
                                                <div class="car-park-detail__accordion-subinfo">

                                                    {{ if {tier.pre_book_rate} != -1 || {tier.drive_up_rate} != -1 }}                                                    
                                                    <div class="details">
                                                        <div class="time">{{tier.description}}</div>
                                                        <div class="pricing">
                                                           {{ if {tier.pre_book_rate} != -1 }}
                                                            {{ $prebookAndFee = {math( {tier.pre_book_rate} + {$carparkBookingFee} )} }}
                                                            <div class="online">Online ${{$prebookAndFee.number_format(2)}}</div>
                                                            {{ end-if }}
                                                            {{ if {$isMulti} != 1 && {tier.drive_up_rate} != -1 }}
                                                            <div>Drive-up ${{tier.drive_up_rate.number_format(2)}}</div>
                                                            {{ end-if }}
                                                        </div>
                                                    </div>
                                                    {{ end-if }}

                                                    {{ if {tier.pre_book_rate} != -1 }}
                                                    <div class="book-btn" data-ecomm-trigger='select' 
                                                        data-ecomm-name-and-id="{{$carparkName}}, {{$productName}}" 
                                                        data-ecomm-brand="{{$carparkName}}" 
                                                        data-ecomm-category="{{$category}}"
                                                        data-ecomm-variant="{{tier.description}}"
                                                        data-ecomm-index="{{tier._num}}"
                                                    (**    //do not change **)
                                                        data-ecomm-price="{{tier.pre_book_rate.number_format(2)}}"
                                                        data-item-list-name="Car park page">
                                                        {{ $rangeFrom = {tier.range_from} }}
                                                        {{ if {tier.range_from} < 30 }}
                                                            {{ $rangeFrom = 120 }}
                                                        {{ end-if }}
                                                        {{ $rootFindUrl = {$langPrefix}/car-parks/?latitude={$latitude}&longitude={$longitude}&maxDistance=2500&limit=100&carparkId={$carparkId}&term={this.title} }}
                                                        {{ if {$category} == 'EarlyBird'  }}
                                                            <a href="{{$rootFindUrl}}&primaryCategory=allday&categories=earlybird&isEarlybird=true">Book</a>
                                                        {{ else if {$isMulti} == 1}}
                                                              <a href="{{$rootFindUrl}}&primaryCategory=multi&categories=overnight&categories=multi&categories=allday">Book</a>
                                                         {{ else if {$isSpecialDay} == 'true'}}

                                                             <a href="{{$rootFindUrl}}&primaryCategory={{$category.slugify()}}&entryDateTime={{$validFrom}}&showCalendar=true&exitTimeMinutes={{$rangeFrom}}">Book</a>
                                                        {{ else }}
                                                            <a href="{{$rootFindUrl}}&primaryCategory={{$category.slugify()}}&exitTimeMinutes={{$rangeFrom}}">Book</a>
                                                        {{ end-if }}
                                                    </div>
                                                     {{ end-if }}
                                                </div>
                                            {{end-each}}                                 
                                        {{end-each}}
                                        </div>  
                                     </div> 
                            {{end-each}}
                    {{end-each}}
                    <div class="car-park-detail__accordion-item has-children">  
                        <div class="car-park-detail__accordion-wrapper">
                            <div class="car-park-detail__accordion-item-title">Subscription Parking</div>
                            <div class="car-park-detail__accordion-item-add"></div>
                        </div>
                        <div class="car-park-detail__accordion-subitem">
                            <div>
                                Get in touch to find out about our subscription parking offerings
                            </div>   
                            <div class="general"></div>                         
                            <div class="car-park-detail__accordion-subinfo">
                                <div class="details subscription">
                                    <div class="time">Flexi-Parking</div>
                                    <div>Prepaid blocks of parking to use as and when you need</div>
                                    </div>
                                <div class="book-btn">
                                    <a href="{{$langPrefix}}/contact-us/flexi-voucher-parking/?state={{$carparkState}}&carparkId={{this.title}}">Enquire Now</a>
                                </div>
                            </div>
                            <div class="car-park-detail__accordion-subinfo">
                                <div class="details subscription">
                                    <div class="time">Monthly Parking</div>
                                    <div>The best parking deals when you rent a bay by the month</div>
                                </div>
                                <div class="book-btn">
                                    <a href="{{$langPrefix}}/contact-us/monthly-or-subscription-parking/?state={{$carparkState}}&carparkId={{this.title}}">Enquire Now</a>
                                </div>
                            </div>
                            <div class="car-park-detail__accordion-subinfo">
                                <div class="details subscription">
                                    <div class="time">Monthly Motorcycle Parking</div>
                                    <div>Great deals for 2 wheels</div>
                                </div>
                                <div class="book-btn">
                                    <a href="{{$langPrefix}}/contact-us/monthly-motorcycle-parking/?state={{$carparkState}}&carparkId={{this.title}}">Enquire Now</a>
                                </div>
                            </div>
                        </div>                 
                    </div>
                    </div>
                    {{ include /cart/cart-item-info-block }}
                    {{ include /booking/booking-details-terms }}
                </div>
            </div>
        </div>
    </div>
    <div class="car-park-detail__right">
        <div class="car-park-detail__map">
            <img data-img="https://maps.googleapis.com/maps/api/staticmap?center={{$latitude}},{{$longitude}}&scale=2&zoom=17&size=640x640&style=feature:poi|visibility:off&markers=anchor:50,64|icon:https://d1dxkf4q.media.zestyio.com/pin-online-p.png?width=48|{{$latitude}},{{$longitude}}&key=AIzaSyBd09P3v5BMSE4tkl6kgv7qJZGsGYV0mD0" />
        </div>
    </div>
    <div class="car-park-detail__booking-wrapper">
        <div class="wrapper-map-left">
            <div class="car-park-detail__book">

                <div class="car-park-detail__cta">
                    Book this car park
                </div>
            </div>
        </div>
    </div>
</section>
{{ end-each }}