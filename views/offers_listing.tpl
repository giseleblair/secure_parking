<section class="deals-listing">
    <div class="wrapper">
        <h1>{{this.title}}</h1>
        {{ $type = {get_var.type} }}
        <div class="account-form__item">
            <select name="offer-event" id="offer-event" onchange="location = this.value;" style="max-width: 40rem;">
                <option value="" disabled="" selected="" hidden="">
                    {{ if {$type} === ""}} Select type 
                    {{ else-if {$type} === 'All'}}
                        {{ $type }}
                    {{ else }} 
                        {{ $type }}s 
                    {{ end-if }}
                </option>
                <option value="{{ page.getUrl() }}?type=All">All</option>
                <option value="{{ page.getUrl() }}?type=Offer">Offers</option>
                <option value="{{ page.getUrl() }}?type=Event">Events</option>
            </select>
        </div>
        <div class="deals-listing__container">
            {{ $counter = 0 }}
            {{ $show = {this.show} }}
            {{ if {get_var.p} }}
            {{ $show = {math({$show} + {get_var.p})} }}
            {{ end-if }}

            {{$dealType = ''}}
            {{ if {$type} === 'Event'}}
                {{$dealType = event}}
            {{ else-if {$type} === 'Offer'}}
                {{$dealType = offer}}
            {{ end-if}}

            {{ each offer_item as deals where (( '{$type}' = '' or '{$type}' = 'All' or deals.offer_or_event = '{$dealType}' ) and deals.parent_zuid = '{page.zuid}') and (('{instance.current_lang.code}' = 'en-au' and deals.show_in_au = '1') or ('{instance.current_lang.code}' = 'en-nz' and deals.show_in_nz = '1') or ('{instance.current_lang.code}' = 'en-us'))   }}
                {{ $totalSize = {deals._length} }} 
            {{ end-each }}

            {{ each offer_item as deals where (( '{$type}' = '' or '{$type}' = 'All' or deals.offer_or_event = '{$dealType}' ) and deals.parent_zuid = '{page.zuid}') and (('{instance.current_lang.code}' = 'en-au' and deals.show_in_au = '1') or ('{instance.current_lang.code}' = 'en-nz' and deals.show_in_nz = '1') or ('{instance.current_lang.code}' = 'en-us'))   order by deals.sort limit {$show} }}

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
        </div>
    </div>

    {{ if {$totalSize} > {$currentSize} }}
    <a href="{{ page.getUrl() }}?type={{$type}}&p={{$show}}">
        <div class="wrapper text-center">
            <div class="primary-btn">
                Show More
            </div>
        </div>
    </a>
    {{ end-if }}
</section>