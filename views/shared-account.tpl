{{ include _env }}
<style>
   @media only screen and (max-width: 1100px) {
   .account-menu .vehicles-list {
   display: none;
   }
   }
</style>
    <div class="account-menu__upper">
        <div class="account-menu-overlay"></div>
        <div class="wrapper">
            {{if {this.set_zuid} == {$accountPageId} }}
                    <h1 class="account-menu__main-title">Account</h1>
            {{else}}
                 <h2 class="account-menu__main-title account-title-sidebar">Account</h2>
            {{end-if}}
            {{ include /misc/loader }}
            <div class="account-menu__tabs">
                <div class="account-menu__tab-item details guest">
                    <div class="account-menu__icon account-menu__icon--account"></div>
                    <div class="account-menu__info">

                        <div class="account-menu__title guest sign-register-link" onclick="signIn('loginPopup')">Register or sign in</div>
                    </div>
                </div>              
                <a href="{{$langPrefix}}/account/personal-details" class="logged-in">
                    <div class="account-menu__tab-item details">
                        <div class="account-menu__icon account-menu__icon--account"></div>
                        <div class="account-menu__info">
                            <div class="account-menu__title">Personal Details</div>
                            <div class="account-menu__subtitle">Name, saved addresses, password</div>
                        </div>
                    </div>
                </a>
                <a href="{{$langPrefix}}/account/vehicles" class="logged-in">
                    <div class="account-menu__tab-item vehicles">
                        <div class="account-menu__icon account-menu__icon--vehicle"></div>
                        <div class="account-menu__info">
                            <div class="account-menu__title">Vehicles</div>
                        </div>
                    </div>
                </a>
                <a href="{{$langPrefix}}/account/bookings" class="logged-in">
                    <div class="account-menu__tab-item bookings">
                        <div class="account-menu__icon account-menu__icon--booking"></div>
                        <div class="account-menu__info">
                            <div class="account-menu__title">Bookings</div>
                        </div>
                    </div>
                </a>
                <a href="{{$langPrefix}}/account/payment-methods/" class="logged-in">
                    <div class="account-menu__tab-item payment-method">
                        <div class="account-menu__icon account-menu__icon--payment"></div>
                        <div class="account-menu__info">
                            <div class="account-menu__title">Payment Methods</div>
                        </div>
                    </div>
                </a>
                <a href="{{$langPrefix}}/account/receipt-activity" class="logged-in">
                    <div class="account-menu__tab-item receipts">
                        <div class="account-menu__icon account-menu__icon--payment"></div>
                        <div class="account-menu__info">
                            <div class="account-menu__title">Activity Statement</div>
                        </div>
                    </div>
                </a>
                <a href="{{$langPrefix}}/account/preferences" class="logged-in">
                    <div class="account-menu__tab-item preferences">
                        <div class="account-menu__icon account-menu__icon--preferences"></div>
                        <div class="account-menu__info">
                            <div class="account-menu__title">Preferences</div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="account-menu__lower">
        <div class="wrapper">
            <h3>General</h3>
            <div class="account-menu__tabs">
                <a href="{{$langPrefix}}/contact-us">
                    <div class="account-menu__tab-item account-menu__tab-item--secondary">
                        <div class="account-menu__icon account-menu__icon--help"></div>
                        <div class="account-menu__info">
                            <div class="account-menu__title">Help</div>
                        </div>
                    </div>
                </a>
                <a href="{{$langPrefix}}/about/stuff-to-know/">
                    <div class="account-menu__tab-item account-menu__tab-item--secondary">
                        <div class="account-menu__icon account-menu__icon--file"></div>
                        <div class="account-menu__info">
                            <div class="account-menu__title">Legal</div>
                        </div>
                    </div>
                </a>
                <div class="logged-in">
                    <div class="account-menu__tab-item account-menu__tab-item--secondary logout">
                        <div class="account-menu__icon account-menu__icon--signout"></div>
                        <div class="account-menu__info">
                            <div class="account-menu__title">
                                <button type="button" class="btn btn-success">Sign Out<button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

