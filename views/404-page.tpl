<!--<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script> -->
  <!--<script type="text/javascript" src="https://alcdn.msauth.net/browser/2.14.2/js/msal-browser.min.js"></script>-->
  <!-- msal.min.js can be used in the place of msal.js; included msal.js to make debug easy -->
{{include _env}}
  <script src="{{$AdvamPaymentGateway}}"></script>
  <script src="https://alcdn.msauth.net/browser/2.13.1/js/msal-browser.js" integrity="sha384-7hwr87O1w6buPsX92CwuRaz/wQzachgOEq+iLHv0ESavynv6rbYwKImSl7wUW3wV" crossorigin="anonymous"></script>

    <!-- To help ensure reliability, Microsoft provides a second CDN -->
  <script type="text/javascript">
      if(typeof Msal === 'undefined')document.write(unescape("%3Cscript src='https://alcdn.msftauth.net/browser/2.13.1/js/msal-browser.min.js' type='text/javascript' crossorigin='anonymous' %3E%3C/script%3E"));
  </script>

 <div class="page-content" itemprop="mainContentOfPage">
    {{include navMenu}}
    {{include searchFlyout}}
    {{include accountFlyout}}
    {{include bookingFlyout}}
    {{include cartFlyout}}
    {{include mobileNav}}
    {{include mobileNavFooter}}
    <section class="mobile-cart">
      {{ include misc/status-bar }}
      {{ include cart }}
    </section>
    {{ include /payment/card-details }}
    <main>
        <div class="news-article__item">
        <div class="wrapper">
            <div class="news-article__title-wrapper">
                <h1 class="news-article__title">Uh oh....</h1>
            </div>
        </div>

        <div class="bg-white">
            <div class="wrapper">
                <div class="news-article__content">
        <h2 class="subtitle">Something's not right here</h2>
        <p>Try refreshing your page or going to home page to&nbsp;<a href="{{$langPrefix}}/car-parks/">Find a Car Park and make a booking</a></p>
        <br>
        <p>If you have a question <a href="#">contact us</a>&nbsp;at a local office or call:</p>
        <p><a rel="noopener noreferrer" href="tel:{{ globals.phone }}" title="Call Now"><button class="ui button button-blue button-small">{{ globals.phone }}</button></a></p>
        <br>
        <p>Prefer Secure Parking to contact you? Please complete the relevant contact form here:</p>
        <p><a href="{{$langPrefix}}/contact-us/"><button class="ui button button-blue button-small">Enquire Now</button></a></p>
                </div>
            </div>
        </div>
    </div>
        
    </main>
    {{include navFooter}}     
</div>

<!-- Setting in Developer settings to auto include in head -->
<script src="/site.js?ts=20230308"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id={{ globals.gtag_id }}"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', '{{ globals.gtag_id }}');
</script>

