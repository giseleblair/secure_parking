<section class="news-article news-article--team-item">
    <div class="wrapper">
        <div class="news-article__heading">
            <div class="news-article__subtitle">{{breadcrumbs(0,>)}}</div>

        </div>
    </div>
    <div class="news-article__item">
        <div class="wrapper">
            <div class="team-item-banner">
                <picture>
                            <source srcset="{{this.team_image.getImage()}}?width=700&crop=1:1" media="(max-width: 599px)" />
                            <source srcset="{{this.team_image.getImage()}}?width=1400&crop=1:1" media="(min-width: 600px)" />
                            <img src="{{this.team_image.getImage()}}?width=700&crop=1:1" />
                        </picture>
            </div>
        </div>
        <div class="wrapper">
            <div>
                <h1 class="news-article__title">{{this.title}}</h1>
                <h2>{{this.description}}</h2>
            </div>
        </div>

   
            <div class="wrapper">
                <div class="news-article__content">

                    {{this.content.replace(href="(?!http).*?, href="{$langPrefix}$1) }}
                </div>
            
        </div>
    </div>
</section>