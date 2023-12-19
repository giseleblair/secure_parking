<style>
.mb-16 {
    margin-bottom: 40px;
}
.my-4 {
    margin-top: 10px;
    margin-bottom: 10px;
}
    .lds-ripple {
        position: relative;
        display: inline-block;
        width: 8rem;
        height: 8rem;
    }
    .lds-ripple div {
        position: absolute;
        opacity: 1;
        border-radius: 50%;
        animation: lds-ripple 1s cubic-bezier(0, 0.2, 0.8, 1) infinite;
    }
    .lds-ripple div:nth-child(2) {
        animation-delay: -0.5s;
    }
    @keyframes lds-ripple {
        0% {
            top: 36px;
            left: 36px;
            width: 0;
            height: 0;
            opacity: 1;
        }
        100% {
            top: 0px;
            left: 0px;
            width: 72px;
            height: 72px;
            opacity: 0;
        }
    }
    .hide {
        display: none;
    }

    </style>



<section class="mobile-nav">
    <div class="wrapper">
        <div class="mobile-nav__logo">
            <a href="{{$langPrefix}}/"> <img src='https://24twnq5l.media.zestyio.com/logo-marketing.svg'></a>
        </div>
        <div class="mobile-nav__icons">

            <a class="mobile-nav__icon mobile-nav__icon--phone" href="tel:{{globals.phone}}"></a>

            <div class="mobile-nav__icon mobile-nav__icon--cart">
                <div class="cart-circle"> </div>
            </div>
            <div class="mobile-nav__icon mobile-nav__icon--menu"></div>
        </div>
    </div>
    <!-- Mobile Status Bar -->
    {{ include /misc/status-bar }}
</section>

<section class="mobile-nav-extended">
    <div class="mobile-nav-extended__upper">
        <div class="wrapper">
            <div class="mobile-nav-extended__search">
                <span class="mobile-nav-extended__search-icon"></span>
                <input placeholder="Search">
             
            </div>
      <div class="loader mobile-content" style="display:none; text-align:center; margin-top: 20px;">
                <div class="lds-ripple"><div class="white"></div><div></div></div>
            </div>
 
            
        </div>



  <div id="content-search-results-mobile" class="search-widget__results" style="display:none">
            <div class="search-widget__container">
                <div class="search-widget__filters">
                    <div class="search-widget__empty-term">Search Term</div>
                    <div class="search-widget__clear-all">Clear<span style="background-image: url('https://24twnq5l.media.zestyio.com/grey-close-sign.svg')"></span></div>
                </div>
            <div class="items"> </div>
               

            </div>
        </div>


        <ul class="mobile-nav-extended__primary">


            {{ each header_links as navItem order by navItem.sort ASC}} {{ $linkHref = {navItem.external_url} }} {{ if {$linkHref} == "" }} {{ $linkHref = {truepath({navItem.internal_url})} }} {{ end-if }}

            <li class="mobile-nav-extended__primary-item"><a href="{{$linkHref}}">{{ navItem.title }}</a> 
            {{ if {navItem.child_links} }}
                <ul class="mobile-nav-extended__secondary">
                    <li><a href="{{$linkHref}}">{{ navItem.title }}</a></li>
                    {{ each header_secondary_links as subItem where find_in_set(subItem.zuid, '{navItem.child_links}') order by subItem.sort ASC }} 
                    {{ $secLinkHref = {subItem.external_url} }} 
                        {{ if {$secLinkHref} == "" }}
                        {{ $secLinkHref = {truepath({subItem.internal_url})} }}
                    {{ end-if }}
                    <li><a href="{{$secLinkHref}}">{{sub_Item.title}}</a></li>
                    {{ end-each }}
                </ul>
                {{ end-if }}
            </li>
            {{ end-each }}
             {{each find_car_parks_button_links as link}}
                {{ $findParkLinkHref = {truePath({link.page_link})} }}
                <li class="mobile-nav-extended__primary-item">
                    <a class="primary-btn primary-btn--find-park-nav" href="{{$findParkLinkHref}}?{{link.query_string}}"><div>{{link.button_text}}</div></a>
                </li>
            {{end-each}}
        </ul>
    </div>

    <div class="mobile-nav-extended__lower">
        <ul class="mobile-nav-extended__primary">
            {{ each navigation_settings as nav_settings where nav_settings.title = "Top Nav Settings"}} {{ each nav_link as link where find_in_set(link.zuid, '{nav_settings.navigation_links}') order by link.sort ASC }}
            <li class="mobile-nav-extended__primary-item"><a href="{{truepath({link.internal_url})}}">{{link.title}}</a></li>
            {{end-each}} {{ end-each}}
        </ul>
    </div>
</section>
