<div class="generic-content-page">
    <div class="simple-page">
         <div class="wrapper">
             {{ if {page.parent_zuid} != 0}}
            <div class="news-article__subtitle" style="padding-top: 20px;">{{breadcrumbs(0,>)}}</div>
            {{ end-if }}

          <div class="news-article__title-wrapper"> 
                <h1 itemprop="name headline" class="news-article__title">{{this.title}}</h1>
            </div> 
        </div> 
        {{if {this.simple_tab_list} != ''}}
        <section class="locations-list">
            <div class="wrapper">
                <div class="account-menu__tabs">
               
                {{ each simple_tab as tab where find_in_set(tab.zuid, '{this.simple_tab_list}') order by tab.sort ASC }}
                <a href="{{ truepath({tab.link}) }}">
                    <div class="account-menu__tab-item ">
                        <div class="account-menu__info">
                            <div class="account-menu__title">{{ tab.title }}</div>
                            {{ if {tab.description} != "" }}
                                <div class="account-menu__description">{{tab.description}}</div>
                            {{ end-if }}
                        </div>
                    </div>
                </a>
                {{ end-each }}            
                </div>
            </div>
        </section>
        {{ end-if }}
        <div class="bg-white"> 
            {{if {this.image.getImage()} != ''}}
                <div class="wrapper">
                    <div class="news-article__banner">
                        <div class="news-article__img-wrapper">                            
                        <picture>
                            <source srcset="{{this.image.getImage()}}?width=700&crop=3:2" media="(max-width: 599px)" />
                            <source srcset="{{this.image.getImage()}}?width=1400&crop=14:6" media="(min-width: 600px)" />
                            <img src="{{this.image.getImage()}}?width=700&crop=14:6" />
                        </picture>
                        </div>
                    </div>
                </div>
            {{end-if}}
            <div class="wrapper"> 
                <div class="news-article__content" itemprop="mainContentOfPage">
                    <div itemprop="text">
                    {{ this.content.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1) }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


