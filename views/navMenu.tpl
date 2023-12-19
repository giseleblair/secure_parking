{{include _env}}
<section class="main-nav">
    <div class="main-nav__upper">
        <div class="wrapper">
            <ul class="main-nav__links">
                {{ each navigation_settings as nav_settings where nav_settings.title = "Top Nav Settings"}}
                    {{ each nav_link as link where find_in_set(link.zuid, '{nav_settings.navigation_links}') order by link.sort ASC }}                   
                           
                             {{ $linkHref = {link.external_url_link} }}
        
                    {{ if {$linkHref} == "" }}
                    {{ $linkHref = {truepath({link.internal_url})} }}
                    {{ end-if }}

                            <li><a href="{{$linkHref}}">{{link.title}}</a></li>
                    {{end-each}}
                {{ end-each}}
            </ul>
        </div>
    </div>
    <div class="main-nav__lower">
        <div class="wrapper">
            <div class="main-nav__main">
                <div class="main-nav__logo">
                    <a href="{{$langPrefix}}/"> <img src='https://24twnq5l.media.zestyio.com/logo-marketing.svg' alt="Secure Parking Logo"></a>
                </div>
                <ul class="main-nav__list">
                    {{ each header_links as navItem order by navItem.sort ASC}}

                    {{ $linkHref = {navItem.external_url} }}
                    {{ if {$linkHref} == "" }}
                    {{ $linkHref = {truepath({navItem.internal_url})} }}
                    {{ end-if }}

                    <li class="main-nav__item"><a href='{{$linkHref}}'>{{ navItem.title }}</a>
                        {{ if {navItem.child_links} }} 
                        <ul class="main-nav__secondary-menu">
                            {{ each header_secondary_links as subItem where find_in_set(subItem.zuid, '{navItem.child_links}') order by subItem.sort ASC }}                           {{ $secLinkHref = {subItem.external_url} }}
                            {{ if {$secLinkHref} == "" }}
                            {{ $secLinkHref = {truepath({subItem.internal_url})} }}
                            {{ end-if }}
                            <li><a href="{{$secLinkHref}}">{{subItem.title}}</a></li>
                            {{ end-each }}
                        </ul>
                        {{ end-if }}
                    </li>
                    {{ end-each }}
                </ul>
                <div style="display: flex; align-items: center; height: 100%;">
                    <ul class="main-nav__info">
                        <li >
                            <a class="main-nav__link main-nav__link--phone" href="tel:{{globals.phone}}"></a>
                        </li>
                        <li>
                            <a class="main-nav__link main-nav__link--search" data-target="search" href="{{$langPrefix}}"></a>
                        </li>
                        <li >
                            <a class="main-nav__link main-nav__link--calendar" data-target="booking" href="{{$langPrefix}}"></a>
                        </li>
                        <li >
                            <a class="main-nav__link main-nav__link--profile" data-target="account" href="{{$langPrefix}}"></a>
                        </li>
                        <li >
                            <a class="main-nav__link main-nav__link--cart  main-nav__link" data-target="cart" href="{{$langPrefix}}">
                            <div class="cart-circle"></div>
                            </a>
                        </li>
                    </ul>
                    {{each find_car_parks_button_links as link}}
                        {{ $findParkLinkHref = {truePath({link.page_link})} }}
                        <a class="primary-btn primary-btn--find-park-nav" href="{{$findParkLinkHref}}?{{link.query_string}}"><div>{{link.button_text}}</div></a>
                    {{end-each}}
                </div>
            </div>
        </div>
    </div>
    <div class="main-nav__overlay"></div>
</section>
    

  