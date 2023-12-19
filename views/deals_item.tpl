{{ $dealType = {this.offer_or_event} }}
<section class="news-article event-item">
  <div class="wrapper">
    <div class="news-article__heading">
      <div class="news-article__subtitle">{{breadcrumbs(0,>)}}</div>
      <div class="news-article__share"></div>
    </div>
  </div>
  <div class="news-article__item">
    <div class="wrapper image">
      <div class="news-article__banner">
        <picture>
          <source srcset="{{this.deal_image.getImage()}}?width=700&crop=3:2" media="(max-width: 599px)" />
          <source srcset="{{this.deal_image.getImage()}}?width=1400&crop=14:6" media="(min-width: 600px)" />
          <img src="{{this.deal_image.getImage()}}?width=700&crop=14:6" />
        </picture>
      </div>
    </div>
    <div class="wrapper title-banner">
      <div class="news-article__title-wrapper">
        <h1 class="news-article__title">{{this.title}}</h1>
      </div>
    </div>
    <style>
      @media only screen and (min-width: 810px) {
        .wrapper.image {
          display: none;
        }

        .title-banner {
          background-image: url('{{this.deal_image.getImage()}}?width=1400&crop=14:3&brightness=45');
          background-size: cover;
          height: 100%;
          width: 100%;
          z-index: -10;
          background-position: center;
          margin: 0 auto;
        }
      }

      @media only screen and (min-width: 1400px) {
        .title-banner {
          margin-bottom: 7rem;
        }
      }
    </style>
    <div class="bg-white">
      <div class="wrapper">
        <div class="news-article__content">
          {{ page.content.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1) }}
          {{ if {this.event_display_tab} != "" }}
          <div class="event-display">
            {{each event_display as item where find_in_set(item.zuid,'{this.event_display_tab}') sort by item.date_from }}
            <div class="car-park-detail__accordion-item-title">
              <h2> {{ item.title }}</h2>
              <div class="car-park-detail__accordion-item-subtitle">{{ item.date_from.date(D j F Y)}} - {{ item.date_to.date(D j F Y)}} </div>
              <div class="car-park-detail__accordion-item-subtitle">{{ item.event_desc }}</div>
            </div>
            {{ each moq_product_details as event_product where find_in_set(event_product.zuid, '{item.product_selection}') }}
            {{ each moq_carpark_details as group_carpark where find_in_set('{event_product.zuid}', group_carpark.products) }}
            <div class="event-display__prod-group">
              <div class="car-park-detail__accordion-subinfo">
                <div class="details">
                  <div class="time">
                    <a href="{{$langPrefix}}{{group_carpark.name}}">{{ group_carpark.name}}</a>
                  </div>
                </div>
                <div>
                  <div class="book-btn">
                    <a href="#">Book $10</a>
                  </div>
                </div>
              </div>
            </div>
            {{ end-each}}
            {{ end-each }}
            {{ each moq_event as event where find_in_set(event.zuid, '{item.linked_moq_event}') }}
            <div class="car-park-detail__accordion">
              <div class="car-park-detail__accordion-item">
                <div class="car-park-detail__accordion-wrapper">
                  <div class="car-park-detail__accordion-item-title">
                    <span>{{ event.name }} </span>
                    <div class="car-park-detail__accordion-item-subtitle">
                      {{ if {event.startdate} }} {{ event.startdate.date(D j F Y) }} {{ end-if }} {{ if {event.enddate} }} - {{ event.enddate.date(D j F Y) }} {{ end-if }}
                    </div>
                  </div>
                  <div class="car-park-detail__accordion-item-instruction">
                    <span class="text">Show</span> Carparks <span class="icon"></span>
                  </div>
                </div>
                <div class="car-park-detail__accordion-subitem">
                  <div class="desc">{{ $eventDesc }}</div> (** if any carparks are directly associated with moq event, display them **) {{ if {event.carpark} }}
                  {{ each moq_carpark_details as event_carpark where find_in_set(event_carpark.zuid, '{event.carpark}') }}
                  {{ $minPrice = 1000 }}
                  {{ $show = false }}
                  {{ $carparkBookingFee = {event_carpark.booking_fee} }}

                  {{ each moq_product_details as product where find_in_set(product.zuid, '{event_carpark.products}') }}
                  {{$productCategory = {product.category} }}
                  {{ each moq_rate_details as rate where find_in_set(rate.zuid, '{product.rates}') }}
                  {{ each moq_configuration_details as config where find_in_set(config.zuid, '{rate.configurations}') }}
                  {{ each moq_tier_details as tier where find_in_set(tier.zuid, '{config.tiers}') }}
                  {{ $show = true }}
                        {{ if {tier.pre_book_rate} != -1 }}
                            {{ $prebookPlusFee = {math( {tier.pre_book_rate} + {$carparkBookingFee} )} }}
                        {{ end-if }}
                  {{ if {$minPrice} > {$prebookPlusFee} && {tier.pre_book_rate} != -1 }}
                  {{ $minPrice = {$prebookPlusFee} }}
                  {{ end-if }}
                  {{end-each}}
                  {{end-each}} (** Each product **) {{end-each}}
                  {{end-each}}
                  {{ if {$show} == true }}
                  <div class="car-park-detail__accordion-subinfo">
                    <div class="details">
                      <div class="time">{{ event_carpark.name }}</div>
                      <div class="pricing">
                        <div>Parking from {{$minPrice}}</div>
                      </div>
                    </div>
                    <div class="book-btn">
                      <a>Book</a>
                    </div>
                  </div>
                  {{ end-if }}
                  {{ end-each }}
                  {{ end-if }} (** if there are territories associated with moq event, go through them & display the carparks associated with them **) {{ if {event.territories} }}
                  {{ each moq_territory as event_territory where find_in_set(event_territory.zuid, '{event.territories}') }}
                  {{ $eventTerr = {event_territory.name} }}
                  {{ each moq_carpark_details as territory_carpark where find_in_set('{event_territory.zuid}', territory_carpark.territories) }}
                  {{ $latitude = {territory_carpark.latitude} }}
                  {{ $longitude = {territory_carpark.longitude} }}
                  {{ $moqid = {territory_carpark.moqid} }}
                  {{ $carparkName = {territory_carpark.name} }}
                  {{ $carparkUrl = {blog.first().getUrl()} }}
                  {{ $carparkBookingFee = {territory_carpark.booking_fee} }}
                  {{ $carparkCountry = {territory_carpark.address_country} }}
                  {{ each carpark_details as item where item.moq_details = '{territory_carpark.zuid}' }}
                  {{ $minPrice = 1000 }}
                  {{ $show = false }}
                  {{ each moq_product_details as product where find_in_set(product.zuid, '{territory_carpark.products}') }}
                  {{ each moq_rate_details as rate where find_in_set(rate.zuid, '{product.rates}') }}
                  {{ each moq_configuration_details as config where find_in_set(config.zuid, '{rate.configurations}') }}
                  {{ each moq_tier_details as tier where find_in_set(tier.zuid, '{config.tiers}') }}
                  {{ $show = true }}
                  {{ if {tier.pre_book_rate} != -1 }}
                            {{ $prebookPlusFee = {math( {tier.pre_book_rate} + {$carparkBookingFee} )} }}
                        {{ end-if }}
                  {{ if {tier.pre_book_rate} != -1 && {$minPrice} > {$prebookPlusFee} }}
                  {{ $minPrice = {$prebookPlusFee} }}
                  {{ end-if }}
                  {{end-each}}
                  {{end-each}}
                  {{end-each}}
                  {{end-each}} (** {{ if {$show} === true }}
                  <div class="car-park-detail__accordion-subinfo">
                    <div class="details">
                      <div class="time">{{$carparkName}}</div>
                      <div class="pricing">
                        <div>Parking from {{$minPrice}}</div>
                      </div>
                    </div>
                    <div class="book-btn">
                      <a href="{{$langPrefix}}/car-parks/?latitude={{$latitude}}&longitude={{$longitude}}&maxDistance=2500&limit=100&primaryCategory=hourly&carparkId={{$moqid}}&entryDateTime={{event.startdate.date(Y-m-d H:i:s)}}&exitDateTime={{event.enddate.date(Y-m-d H:i:s)}}">Book</a>
                    </div>
                  </div>
                  {{ else }} **) <div class="car-park-detail__accordion-subinfo">
                    <div class="details">
                      <div class="time">{{$carparkName}}</div>
                    </div>
                    <div class="book-btn">
                      <a href="$carparkUrl">View Car Park</a>
                    </div>
                  </div> (** {{ end-if }} **) {{end-each}}
                  {{ end-each }}
                  {{ end-each }}
                  {{ end-if }}
                </div>
              </div>
            </div>
            {{ end-each }}
            {{ end-each }}
          </div>
          {{ end-if }}
          {{ if {this.territories} != null }}
          <div class="bg-white location__accordion-wrapper">
            <div class="wrapper">
              <div class="car-park-detail__accordion prod-rates">
                {{ each moq_territory as territory where find_in_set(territory.zuid, '{this.territories}') }}
                {{ each moq_carpark_details as territory_carpark where find_in_set('{territory.zuid}', territory_carpark.territories) }}
                {{ each carpark_details as item where item.moq_details = '{territory_carpark.zuid}' }}
                {{ $latitude = {territory_carpark.latitude} }}
                {{ $longitude = {territory_carpark.longitude} }}
                {{ $moqid = {territory_carpark.moqid} }}
                {{ $carparkName = {territory_carpark.name} }}
                {{ $address_street = {territory_carpark.address_street} }}
                {{ $address_suburb = {territory_carpark.address_suburb} }}
                {{ $address_country = {territory_carpark.address_country} }}
                {{ $carparkUrl = {truepath({item.zuid})} }}
                {{ $showPark = 100}}
                {{ $carparkBookingFee = {territory_carpark.booking_fee} }}
                {{ each moq_product_details as product where find_in_set(product.zuid, '{territory_carpark.products}') }}
                {{if {product.rates}.length > 0 }}
                {{$showPark = 9999}}
                {{end-if}}
                {{end-each}}
                {{if {$showPark} == 9999 }}
                <div class="car-park-detail__accordion-item" data-ecomm-trigger="parent" data-item-list-name="Offer page">
                  <div class="car-park-detail__accordion-wrapper">
                    <div class="car-park-detail__accordion-item-title">
                      <span>{{ $carparkName }}</span>
                      <div class="car-park-detail__accordion-item-subtitle">{{$address_street}}, {{$address_suburb}}</div>
                    </div>
                    <div class="car-park-detail__accordion-item-instruction">
                      <span class="text">Show </span> pricing <span class="icon"></span>
                    </div>
                  </div>
                  <div class="car-park-detail__accordion-subitem">
                    <div class="car-park-detail__accordion-subinfo">
                      <div class="details">
                        <div class="book-btn">
                          <a href="{{$carparkUrl}}">View Car Park</a>
                        </div>
                      </div>
                    </div>
                    {{ each moq_product_details as product where find_in_set(product.zuid, '{territory_carpark.products}') }}
                    {{$productCategory = {product.category} }}
                    {{ $minPrice = 1000 }}
                    {{$obj = [}}
                    {{ $isMulti = false }}
                    {{$display = false}}
                    {{ each moq_rate_details as rate where find_in_set(rate.zuid, '{product.rates}') }}
                    {{ $minRatePrice = 1000 }}
                    {{ $validfrom = {rate.valid_from.date(Y-m-d)} }}
                    {{ $validto = {rate.valid_to.date(Y-m-d)} }}
                    {{ $isSpecialDay = false }}
                    {{ each moq_configuration_details as config where find_in_set(config.zuid, '{rate.configurations}') }}
                    {{ if ({$isSpecialDay} && {config.usage_days} == "SpecialDay") }}
                    {{ $isSpecialDay = true }}
                    {{ end-if }}
                    {{ if {config.is_multi_entry} === true }}
                    {{ $isMulti = true }}
                    {{ end-if }}
                    {{ each moq_tier_details as tier where find_in_set(tier.zuid, '{config.tiers}') }}
                    {{ if {tier.pre_book_rate} != -1 }}
                      {{ $prebookPlusFee = {math( {tier.pre_book_rate} + {$carparkBookingFee} )} }}
                    {{ end-if }}

                    {{ if {tier.pre_book_rate} != -1 && {$minPrice} > {$prebookPlusFee} }}
                    {{ $minPrice = {$prebookPlusFee} }}
                    {{ end-if }}
                    {{ if {$minRatePrice} > {$prebookPlusFee} && {tier.pre_book_rate} != -1 }}
                    {{ $minRatePrice = {$prebookPlusFee} }}
                    {{ end-if }}
                    {{end-each}}
                    {{end-each}}
                    {{ if {$isSpecialDay} == 'true' }}
                    {{ if {$minRatePrice} != 1000 }}
                    {{ $objSpecial = [("validFrom":"{$validfrom} 00:00:00", "validTo": "{$validto} 23:59:59", "minPrice": {$minRatePrice}, "isSpecialDay": "{$isSpecialDay}")] }}
                    {{ end-if }}
                    <div class="car-park-detail__accordion-subinfo" data-ecomm-trigger='parent-view' data-ecomm-name-and-id="{{$carparkName}}, {{$productCategory}}" data-ecomm-brand="{{$carparkName}}" data-rates='{{ $objSpecial }}' data-ecomm-category="{{$productCategory}}" data-timezonelocationcountry="{{$address_country}}">
                      <div class="details">
                        <div class="time">{{ rate.name }}</div>
                        {{ if {$minPrice} != 1000 }}
                        <div class="pricing">
                          <div>Parking from <span class="min-rate"></span>
                          </div>
                        </div>
                        {{ end-if }}
                      </div>
                      <div class="book-btn">
                        {{ $productCategory = {product.category} }}
                        {{if {$isMulti} === true }}
                        {{ $productCategory = multi }}
                        {{ end-if }}
                        <a href="{{$langPrefix}}/car-parks/?latitude={{$latitude}}&longitude={{$longitude}}&maxDistance=2500&limit=100&carparkId={{$moqid}}&primaryCategory={{$productCategory.slugify()}}&showCalendar=true&entryDateTime={{$validfrom}}&&term={{$carparkName}}">Book</a>
                      </div>
                    </div>
                    {{ else }}
                    {{ if {$minRatePrice} != 1000 }}
                    {{ $display = true }}
                    {{ $obj = {$obj} ("validFrom":"{$validfrom} 00:00:00", "validTo": "{$validto} 23:59:59", "minPrice": {$minRatePrice}, "isSpecialDay": "{$isSpecialDay}") {rate._arraycomma} }}
                    {{ end-if}}
                    {{end-if}}
                    {{end-each}}
                    {{$obj = {$obj}] }}
                    {{ if {$minPrice} != 1000  and {$display} == 'true'}}
                    <div class="car-park-detail__accordion-subinfo" data-ecomm-trigger='parent-view' data-ecomm-name-and-id="{{$carparkName}}, {{$productCategory}}" data-ecomm-brand="{{$carparkName}}" data-rates='{{ $obj }}' data-ecomm-category="{{$productCategory}}" data-timezonelocationcountry="{{$address_country}}">
                      <div class="details">
                        <div class="time">{{ product.name }}</div>
                        {{ if {$minPrice} != 1000 }}
                        <div class="pricing">  <div>Parking from <span class="min-rate"></span>
                          </div>
                        </div>
                        {{ end-if }}
                      </div>
                      <div class="book-btn">
                        {{ $productCategory = {product.category} }}
                        {{if {$isMulti} === true }}
                        {{ $productCategory = multi }}
                        {{ end-if }}
                        <a href="{{$langPrefix}}/car-parks/?latitude={{$latitude}}&longitude={{$longitude}}&maxDistance=2500&limit=100&carparkId={{$moqid}}&primaryCategory={{product.category.slugify()}}&term={{$carparkName}}">Book</a>
                      </div>
                    </div>
                    {{end-if}}
                    {{ end-each }}
                  </div>
                </div>
                {{end-if}}
                {{ end-each }}
                {{ end-each }}
                {{ end-each }}
              </div>
            </div>
          </div>
          
          {{end-if}}
          {{ page.content_below_listing.replace(href="(?!http).*?, href="{$langPrefix}$1) }}
        </div>
      </div>
    </div>
  </div>
</section>