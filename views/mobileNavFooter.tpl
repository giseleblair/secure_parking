{{include _env}}
<div class="mobile-nav__fixed {{if {this.set_zuid} == {$cartPageId} || {this.set_zuid} == {$paymentMethodsPageId} }} hide {{end-if}}">
    <div>
        <div class="mobile-nav__fixed-bar ">
            {{each find_car_parks_button_links as link}}
                {{ $findParkLinkHref = {truePath({link.page_link})} }}
                <a class="primary-btn primary-btn--find-park-nav" href="{{$findParkLinkHref}}?{{link.query_string}}"><div>{{link.button_text}}</div></a>
            {{end-each}}
            <div></div>
            <div>
                <a href="{{$langPrefix}}/account/bookings" class="{{if {this.set_zuid} == {$bookingPageId} }} active {{end-if}}">
                    <div class="mobile-nav__info mobile-nav__info-link mobile-nav__info--calendar"></div>
                    <span>Bookings</span>
                </a>
                <a href="{{$langPrefix}}/account" class="{{if {this.set_zuid} == {$accountPageId} }} active {{end-if}}">
                    <div class="mobile-nav__info mobile-nav__info-link mobile-nav__info--profile"></div>
                    <span>Account</span> 
                </a>
            </div>
        </div>
    </div>
</div>