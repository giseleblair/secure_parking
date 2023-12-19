{{ each terms_and_conditions as term }}
    <div class="booking-details__terms">
        <div class="booking-details__term-wrapper">
            <div class="booking-details__term-icon"></div>
            <h3>{{term.title}}</h3>
        </div>
        {{term.content.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1)}}
    </div>
{{end-each}}


        