{{ include /misc/status-bar }}

<section class="account-form__container logged-in">
    <div class="wrapper">
        <div class="account-form__breadcrumb">
            <span></span>
            <a href="{{$langPrefix}}/account">Back</a>
        </div>
        {{if {this.set_zuid} == {$personalDetailsPageId} }}
                    <h1 class="account-menu__main-title">{{this.title}}</h1>
            {{else}}
                 <h2 class="account-menu__main-title account-title-sidebar">{{this.title}}</h2>
            {{end-if}}

{{include account-form}}

    </section>

        <div class="receipt-activity__guest booking-tabs__guest guest" style="display: none;">
        <div class="wrapper">
            <div class="booking-tabs__guest-content">
                <div class="booking-tabs__guest-title">Create an account or sign in to view your account details</div>
                <div class="cta-full login-link">
                Sign in or register
            </div>
            </div>
        </div>
    </div>

