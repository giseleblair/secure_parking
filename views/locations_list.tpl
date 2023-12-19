<section class="locations-list">
    <div class="wrapper">
        <h1>{{ this.title }}</h1>
        <div class="locations-list__desc" style="margin-bottom:30px">
            {{ this.description.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1)  }}
        </div>
        <div class="account-menu__tabs">
        {{each location as item where find_in_set(item.zuid,'{this.location_selector}') sort by item.title }} 
        <a href="{{ item.getUrl() }}">
            <div class="account-menu__tab-item ">
                <div class="account-menu__info">
                    <div class="account-menu__title">{{ item.title }}</div>
                    {{if {item.description} != ""}}
                        <div class="account-menu__description">{{ item.description }}</div>
                    {{end-if}}
                </div>
            </div>
        </a>
        {{ end-each }}
        </div>
    </div>
</section>