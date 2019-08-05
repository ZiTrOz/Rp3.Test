<template>
    <div>
        <div class="page-header">
            <h1>Balance</h1>
        </div>
        <!-- <div class="help-block" v-if="error.length > 0">
            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <strong>Error: </strong> {{error}}.
            </div>
        </div> -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    
                </div>
            </div>
            <div class="panel-body">
                <p class="m-b-none" v-if="balance.length === 0">
                    No hay transacciones registradas.
                </p>
                <div class="table-responsive" v-if="balance.length > 0">
                    <table id="tTransactions" class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">Category</th>
                                <th class="text-center">Balance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="b in balance">                           

                                <td class="text-center">{{ b.Name }}</td>
                                <td class="text-center">{{ addCommas((b.Total).toFixed(2)) }}</td>                                
                            </tr>
                            <tr>
                                <th class="text-center">Total</th>
                                <td class="text-center"> {{ addCommas((total).toFixed(2)) }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    mounted() {
        this.GetBalance();
    },
    data() {
        return{
            data: new FormData,
            url: window.url,
            balance: [],
            error: '',
            total: 0,
        }
    },
    methods: {
            addCommas(nStr)
				{
				nStr += '';
				let x = nStr.split('.');
				let x1 = x[0];
				let x2 = x.length > 1 ? '.' + x[1] : '';
				var rgx = /(\d+)(\d{3})/;
				while (rgx.test(x1)) {
					x1 = x1.replace(rgx, '$1' + ',' + '$2');
				}
				return x1 + x2;
			},
            GetBalance() {                
                var block = $('<div class="block-loading" />');
                $("body").prepend(block);
                return axios.get(window.url +'transaction/GetBalance')
                    .then(response => {
                        this.balance = response.data;
                        for(let i = 0;  i < response.data.length; i++){
                            this.total += response.data[i].Total; 
                        }
                        block.remove();
                    }).catch(error => {
                        this.error = error;
                        console.log(this.error);
                        block.remove();
                    })
            },
    }
}
</script>
