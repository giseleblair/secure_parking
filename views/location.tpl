<div class="location event-item">
  <div class="wrapper">
    {{ if {page.parent_zuid} != 0}}
    <div class="news-article__subtitle" style="padding-top: 20px;">{{breadcrumbs(0,>)}}</div>
    {{ end-if }}
    <div class="location__content">
      <h1>{{ this.title }}</h1>
      <div class="location__summary">{{ this.summary.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1)  }} </div>
      {{if {this.promotions} > 0 }}
      <div class="location__promotion-block">
        {{each promotion as item where FIND_IN_SET(item.zuid,'{this.promotions}') }}
        <div class="location__highlight">{{ item.title }} </div>
        <div class="location__terms"> {{ item.description }} </div>
        <div class="location__promocode">{{ item.promocode }}</div>
        {{end-each}}
      </div>
      {{end-if}}
    </div>
  </div>
  {{ each moq_territory as territory where find_in_set(territory.zuid, '{this.territories}') }}
  <div class="bg-white location__accordion-wrapper">
    <div class="wrapper">
      <h3>{{ territory.name }}</h3>
      <div class="car-park-detail__accordion prod-rates">
        {{ each moq_carpark_details as territory_carpark where find_in_set('{territory.zuid}', territory_carpark.territories) }}
        {{ each carpark_details as item where item.moq_details = '{territory_carpark.zuid}' }}
        {{ $latitude = {territory_carpark.latitude} }}
        {{ $longitude = {territory_carpark.longitude} }}
        {{ $moqid = {territory_carpark.moqid} }}
        {{ $carparkName = {territory_carpark.name} }}
        {{ $address_street = {territory_carpark.address_street} }}
        {{ $address_suburb = {territory_carpark.address_suburb} }}
        {{ $address_country = {territory_carpark.address_country} }}
        {{ $desc = {item.description} }}
        {{ $show = 100}}
        {{ $carparkBookingFee = {territory_carpark.booking_fee} }}
        {{ each moq_product_details as product where find_in_set(product.zuid, '{territory_carpark.products}') }}
        {{if {product.rates}.length > 0 }}
        {{$show = 9999}}
        {{end-if}}
        {{end-each}}
        {{if {$show} == 9999 }}
        <div class="car-park-detail__accordion-item" data-ecomm-trigger="parent" data-item-list-name="Location page">
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
            {{ each moq_product_details as product where find_in_set(product.zuid, '{territory_carpark.products}') }}
            {{ $minPrice = 1000 }}
            {{$display = false}}
            {{$productCategory = {product.category} }}
            {{$obj = [}}
            {{ each moq_rate_details as rate where find_in_set(rate.zuid, '{product.rates}') }}
            {{ $minRatePrice = 1000 }}
            {{ $validfrom = {rate.valid_from.date(Y-m-d)} }}
            {{ $validto = {rate.valid_to.date(Y-m-d)} }}
            {{ $isSpecialDay = false }}
            {{ each moq_configuration_details as config where find_in_set(config.zuid, '{rate.configurations}') }}
            {{ if ({$isSpecialDay} && {config.usage_days} == "SpecialDay") }}
            {{ $isSpecialDay = true }}
            {{ end-if }}
            {{ each moq_tier_details as tier where find_in_set(tier.zuid, '{config.tiers}') }}
              {{ if {tier.pre_book_rate} != -1 }}
                  {{ $prebookPlusFee = {math( {tier.pre_book_rate} + {$carparkBookingFee} )} }}
              {{ end-if }}
            {{ if {$minPrice} > {$prebookPlusFee} && {tier.pre_book_rate} != -1 }}
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
            <div class="car-park-detail__accordion-subinfo" data-ecomm-trigger='parent-view' data-ecomm-name-and-id="{{$carparkName}}, {{$productCategory}}" data-ecomm-brand="{{$carparkName}}" data-ecomm-category="{{$productCategory}}" data-rates='{{ $objSpecial }}'>
              <div class="details">
                <div class="time">{{ rate.name }}</div>
                {{ if {$minPrice} != 1000 }}
                <div class="pricing">
                  <div>Parking from <span class="min-rate"></span>
                  </div>
                </div>
                {{ end-if }}
              </div>
              <div class="book-btn" data-ecomm-trigger='select' data-ecomm-name-and-id="{{$carparkName}}, {{$productCategory}}" data-ecomm-brand="{{$carparkName}}" data-ecomm-category="{{$productCategory}}" data-ecomm-index="{{product._num}}" data-item-list-name="Location page" data-timezonelocationcountry="{{$address_country}}">
                <a href="{{$langPrefix}}/car-parks/?latitude={{$latitude}}&longitude={{$longitude}}&&maxDistance=2500&limit=100&carparkId={{$moqid}}&entryDateTime={{$validfrom}}&showCalendar=true&term={{$carparkName}}&primaryCategory={{$productCategory.slugify()}}">Book</a>
              </div>
            </div>
            {{ else }}
            {{ if {$minRatePrice} != 1000 }}
            {{ $display = true }}
            {{ $obj = {$obj} ("validFrom":"{$validfrom} 00:00:00", "validTo": "{$validto} 23:59:59", "minPrice": {$minRatePrice}, "isSpecialDay": "{$isSpecialDay}") {rate._arraycomma} }}
            {{ end-if }}
            {{ end-if }}
            {{end-each}}
            {{$obj = {$obj}] }}
            {{ if {$minPrice} != 1000 and {$display} == 'true' }}
            <div class="car-park-detail__accordion-subinfo" data-ecomm-trigger='parent-view' data-ecomm-name-and-id="{{$carparkName}}, {{$productCategory}}" data-ecomm-brand="{{$carparkName}}" data-ecomm-category="{{$productCategory}}" data-rates='{{ $obj }}'>
              <div class="details">
                <div class="time">{{ rate.name }}</div>
                {{ if {$minPrice} != 1000 }}
                <div class="pricing">
                  <div>Parking from <span class="min-rate"></span>
                  </div>
                </div>
                {{ end-if }}
              </div>
              <div class="book-btn" data-ecomm-trigger='select' data-ecomm-name-and-id="{{$carparkName}}, {{$productCategory}}" data-ecomm-brand="{{$carparkName}}" data-ecomm-category="{{$productCategory}}" data-ecomm-index="{{product._num}}" data-item-list-name="Location page">
                <a href="{{$langPrefix}}/car-parks/?latitude={{$latitude}}&longitude={{$longitude}}&&maxDistance=2500&limit=100&carparkId={{$moqid}}&primaryCategory={{product.category.slugify()}}&term={{$carparkName}}">Book</a>
              </div>
            </div>
            {{ end-if }}
            {{ end-each }}
          </div>
        </div>
        {{end-if}}
        {{ end-each }}
        {{ end-each }}
      </div>
    </div>
  </div>
  {{ end-each }}
  <div class="bg-white location__accordion-wrapper">
    <div class="wrapper">
      <div class="location__terms location__terms--disclaimer">{{page.terms.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1) }}</div>
    </div>
  </div>
</div>