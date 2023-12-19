        <div class="cart-item__important">
            <h2>Important information</h2>
            {{ each moq_carpark_details as carparkDetail where carparkDetail.zuid = '{this.moq_details}' }}
                {{if {carparkDetail.entry_instructions} != ''}}
                        <p>{{carparkDetail.entry_instructions.preg_replace(/[\n]/,<br />)}}</p>
                {{end-if}}
                {{if {carparkDetail.exit_instructions} != ''}}
                        <p>{{carparkDetail.exit_instructions.preg_replace(/[\n]/,<br />)}}</p>
                {{end-if}}
                {{if {carparkDetail.general_instructions} != ''}}
                        <p>{{carparkDetail.general_instructions.escapeForJs().preg_replace(/[\n]/,<br />)}}</p>
                {{end-if}}
            {{end-each}}
        </div>