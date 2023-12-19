{{each api.json.get(https://spa-fa-web-search-prd.azurewebsites.net/searchcontent/{get_var.term}) as result}}
    <h3>{{result.title}}</h3>
    <p>{{result.description}}</p>
        <picture>
            <source srcset="{{result.imageZuid.getImage()}}?width=700&crop=3:2" media="(max-width: 599px)" />
            <source srcset="{{result.imageZuid.getImage()}}?width=1400&crop=3:2" media="(min-width: 600px)" />
            <img src="{{result.imageZuid.getImage()}}?width=700&crop=3:2" alt="featured article image"/>
        </picture>
{{end-each}}