<section class="deals-listing deals-listing--team">
    <div class="wrapper">
      <div class="news-article__subtitle custom-breadcrumb">{{breadcrumbs(0,>)}}</div>
        <h1>{{this.title}}</h1>
            <div class="deals-listing__container">


            {{ $show = {this.show} }} 
            {{ if {get_var.p} }} 
            {{ $show = {math({$show} + {get_var.p})} }} 
            {{ end-if }} 
            
            {{ each team_item as teamCounter}} {{ $totalSize = {teamCounter._length} }} {{ end-each }} 
            
            {{ each team_item as team sort by team.sort limit {$show} }}


            <a class="deals-listing__anchor" href="{{deals.getUrl()}}">
                <div class="deals-listing__item">
                    <div class="deals-listing__img-wrapper">
                        {{if {team.team_image.getImage()} != ''}}
                        <picture>
                            <source srcset="{{team.team_image.getImage()}}?width=700&crop=1:1" media="(max-width: 599px)" />
                            <source srcset="{{team.team_image.getImage()}}?width=1400&crop=1:1" media="(min-width: 600px)" />
                            <img src="{{team.team_image.getImage()}}?width=700&crop=1:1" />
                        </picture>
                        {{end-if}}
                    </div>
                    <div class="deals-listing__content-wrapper deals-listing__content-wrapper--team">
                        <h2 class="item-title">{{team.title}}</h2>
                        <p class="body-copy">{{team.description}} </p>
                    </div>
                </div>
            </a>
               {{ $currentSize = {team._length} }} {{ end-each }}
        </div>
    </div>
           {{ if {$totalSize} > {$currentSize} }}
    <div class="wrapper text-center">
        <div class="primary-btn">
            <a href="{{ page.getUrl() }}?p={{$show}}">Show More</a></div>
    </div>
       {{ end-if }}
</section>
