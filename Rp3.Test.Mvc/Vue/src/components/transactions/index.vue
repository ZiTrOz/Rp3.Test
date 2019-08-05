<template>
    <div>
        <div class="page-header">
            <h1>Mis Transacciones</h1>
        </div>
        <div class="help-block" v-if="error.length > 0">
            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <strong>Error: </strong> {{error}}.
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <a class="action-link" @click="newTransaction()">
                        Nueva Transacción
                    </a>
                </div>
            </div>
            <div class="panel-body">
                <p class="m-b-none" v-if="transactions.length === 0">
                    No hay transacciones registradas.
                </p>
                <div class="table-responsive" v-if="transactions.length > 0">
                    <table id="tTransactions" class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Transaction Type</th>
                                <th class="text-center">Category</th>
                                <th class="text-center">Register Date</th>
                                <th class="text-center">Description</th>
                                <th class="text-center">Amount</th>
                                <th class="text-center">Notes</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="t in transactions">                           

                                <td class="text-center">{{ t.TransactionId }}</td>
                                <td class="text-center">{{ t.TransactionType }}</td>
                                <td class="text-center">{{ t.CategoryName }}</td>
                                <td class="text-center">{{ moment(t.RegisterDate).format('DD/MMM/YYYY' ) }}</td>
                                <td class="text-center">{{ t.ShortDescription }}</td>
                                <td class="text-center">{{ addCommas((t.Amount).toFixed(2)) }}</td>
                                <td class="text-center">{{ t.Notes }}</td>
                                <td>
                                    <a class="btn btn-default" @click="editTransaction(t)" title="Edit Transaction">Editar</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal-new" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content modal-lg">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">
                            Nueva Transacción
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="TransactionTypeId" class="col-md-3 control-label">TransactionType</label>
                                <div class="col-md-9">
                                   <select class="form-control" id="TransactionTypeId" @change="onChangeTransactionType($event)" name="TransactionTypeId" v-validate="'required'" :class="{'input': true, 'is-danger': errors.has('TransactionTypeId') }">
                                       <option value="0">Select TransactionType</option>
                                       <option v-for="type in TransactionTypes" :key="type.name" :value="type.TransactionTypeId" :data-value="type.TransactionTypeId" :data-name="type.name"> {{ type.Name }}</option>
                                    </select>
                                    <i v-show="errors.has('TransactionTypeId')" class="fa fa-warning is-danger"></i>
                                    <span v-show="errors.has('TransactionTypeId')" class="help-block">{{ errors.first('TransactionTypeId') }}</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="CategoryId" class="col-md-3 control-label">Category</label>
                                <div class="col-md-9">
                                    <select class="form-control" id="CategoryId" @change="onChangeCategory($event)" name="CategoryId" v-validate="'required'" :class="{'input': true, 'is-danger': errors.has('CategoryId') }">
                                        <option value="0">Select Category</option>
                                       <option v-for="t in Categories" :key="t.Name" :value="t.CategoryId" :data-value="t.CategoryId" :data-name="t.name"> {{ t.Name }}</option>
                                    </select>
                                    <i v-show="errors.has('CategoryId')" class="fa fa-warning is-danger"></i>
                                    <span v-show="errors.has('CategoryId')" class="help-block">{{ errors.first('CategoryId') }}</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="RegisterDate" class="col-md-3 control-label">RegisterDate</label>
                                <div class="col-md-9">
                                    <input type="date" class="form-control" value="{{ t.RegisterDate }}" v-model="t.RegisterDate" name="RegisterDate">                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ShortDescription" class="col-md-3 control-label">ShortDescription</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" v-model="t.ShortDescription" name="ShortDescription" placeholder="ShortDescription" v-validate.initial="'required'" :class="{'input': true, 'is-danger': errors.has('ShortDescription') }">
                                    <i v-show="errors.has('ShortDescription')" class="fa fa-warning is-danger"></i>
                                    <span v-show="errors.has('ShortDescription')" class="help-block">{{ errors.first('ShortDescription') }}</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Amount" class="col-md-3 control-label">Amount</label>
                                <div class="col-md-9">
                                    <input type="number" class="form-control" v-model="t.Amount" name="Amount" placeholder="Amount" v-validate.initial="'required|decimal'" :class="{'input': true, 'is-danger': errors.has('Amount') }">
                                    <i v-show="errors.has('Amount')" class="fa fa-warning is-danger"></i>
                                    <span v-show="errors.has('Amount')" class="help-block">{{ errors.first('Amount') }}</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Notes" class="col-md-3 control-label">Notes</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" v-model="t.Notes" name="Notes" placeholder="Notes" v-validate.initial="'required'" :class="{'input': true, 'is-danger': errors.has('Notes') }">
                                    <i v-show="errors.has('Notes')" class="fa fa-warning is-danger"></i>
                                    <span v-show="errors.has('Notes')" class="help-block">{{ errors.first('Notes') }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn" type="button" data-dismiss="modal">Cancel</button>
                        <input class="btn btn-primary" type="button" value="Save" @click="store()"/>
                    </div>
                </div>
            </div>
        </div>
        <!-- EDIT MODAL -->
        <div class="modal fade" id="modal-edit" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content modal-lg">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">
                            Editar Transacción
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="TransactionTypeId" class="col-md-3 control-label">TransactionType</label>
                                <div class="col-md-9">
                                   <select class="form-control" id="TransactionTypeId" v-model="tEdit.TransactionType" @change="onChangeTransactionType($event)" name="TransactionTypeId">                                       
                                       <option v-for="type in TransactionTypes" :key="type.name" :value="type" :data-value="type.TransactionTypeId" :data-name="type.name"> {{ type.Name }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="CategoryId" class="col-md-3 control-label">Category</label>
                                <div class="col-md-9">
                                    <select class="form-control" id="CategoryId" v-model="tEdit.Category" @change="onChangeCategory($event)" name="CategoryId">                                        
                                       <option v-for="t in Categories" :key="t.Name" :value="t" :data-value="t.CategoryId" :data-name="t.name"> {{ t.Name }}</option>
                                    </select>                                    
                                </div>
                            </div>
                            <!-- <div class="form-group">
                                <label for="RegisterDate" class="col-md-3 control-label">RegisterDate</label>
                                <div class="col-md-9">
                                    <datepicker v-model="tEdit.RegisterDate"></datepicker >
                                    < <input type="date" class="form-control" value="{{ tEdit.RegisterDate }}" v-model="tEdit.RegisterDate" name="RegisterDate">
                                </div>
                            </div> -->
                            <div class="form-group">
                                <label for="ShortDescription" class="col-md-3 control-label">ShortDescription</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" v-model="tEdit.ShortDescription" name="ShortDescription" placeholder="ShortDescription">                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Amount" class="col-md-3 control-label">Amount</label>
                                <div class="col-md-9">
                                    <input type="number" class="form-control" v-model="tEdit.Amount" name="Amount" placeholder="Amount">
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Notes" class="col-md-3 control-label">Notes</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" v-model="tEdit.Notes" name="Notes" placeholder="Notes">                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn" type="button" data-dismiss="modal">Cancel</button>
                        <input class="btn btn-primary" type="button" value="Save" @click="edit()"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            this.GetTransactions();
            this.GetCategories();
            this.t.RegisterDate = moment().format('DD/MM/YYYY');
        },
        data() {
            return{
                data: new FormData,
                url: window.url,
                transactions: [],
                Categories: [],
                TransactionTypes: [],
                //errors: [],
                error: '',
                t: {
                    TransactionTypeId: '',
                    CategoryId: '',
                    RegisterDate: '',
                    ShortDescription: '',
                    Amount: '',
                    Notes: '',
                },
                tEdit:  {
                    TransactionTypeId: '',
                    CategoryId: '',
                    RegisterDate: '',
                    ShortDescription: '',
                    Amount: '',
                    Notes: '',
                    UserId: '',
                    DateUpdate: '',
                    TransactionType: {
                        Name: '',
                        TransactionTypeId: '',
                    },
                    Category: [],
                },
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
            GetTransactions() {                
                var block = $('<div class="block-loading" />');
                $("body").prepend(block);
                return axios.get(window.url +'transaction/GetByUserId')
                    .then(response => {
                        this.transactions = response.data;
                        block.remove();
                    }).catch(error => {
                        this.error = error.response.data;
                        console.log(this.error);
                        block.remove();
                    })
            },
            GetCategories() {                
                var block = $('<div class="block-loading" />');
                $("body").prepend(block);
                return axios.get(window.url +'category/Get')
                    .then(response => {
                        this.Categories = response.data.categories;
                        this.TransactionTypes = response.data.transactionsTypes;
                        console.log(this.TransactionTypes);
                        block.remove();
                    }).catch(error => {
                        this.error = error;
                        console.log(this.error);
                        block.remove();
                    })
            },

            store(){
                this.$validator.validateAll().then(result => {
                    if (!result) {
                        alert('Ingrese lo campos requeridos')
                    }
                    else{
                        if(this.t.TransactionTypeId == '' || this.t.TransactionTypeId === undefined){
                            alert('Select a transaction type');
                            return;
                        }
                        if(this.t.CategoryId == '' || this.t.CategoryId === undefined){
                            alert('Select a category');
                            return;
                        }
                        if(!moment(this.t.RegisterDate).isSame(moment(), 'day')){
                            let diff = moment(this.t.RegisterDate).diff(moment(), 'days');
                            if(diff < -30){
                                alert('RegisterDate must be less than 30 days');
                            }
                            else if (diff > 0){
                                alert('RegisterDate is invalid');
                            }                        
                        }       
                        var block = $('<div class="block-loading" />');
                        $("body").prepend(block);
                        this.data.delete("transaction");
                        this.data.append('transaction', JSON.stringify(this.t));
                        return axios.post(window.url +'transaction/Store', this.data)
                            .then(response => {
                                this.transactions = response.data;
                                this.t.TransactionTypeId = '';
                                this.t.CategoryId = '',
                                this.t.RegisterDate = moment().format('DD/MM/YYYY');
                                this.t.ShortDescription = '',
                                this.t.Amount = '',
                                this.t.Notes = '',
                                $('#modal-new').modal('hide');
                                block.remove();
                            }).catch(error => {
                                this.error = error;
                                alert(this.error);
                                console.log(this.error);
                                block.remove();
                            })
                    }           
                })
            },

            edit(){
                // this.$validator.validateAll().then(result => {
                //     if (!result) {
                //         alert('Ingrese lo campos requeridos')
                //     }
                //     else{
                        if(this.tEdit.TransactionTypeId == '' || this.tEdit.TransactionTypeId === undefined){
                            alert('Select a transaction type');
                            return;
                        }
                        if(this.tEdit.CategoryId == '' || this.tEdit.CategoryId === undefined){
                            alert('Select a category');
                            return;
                        }
                        // if(!moment(this.tEdit.RegisterDate).isSame(moment(), 'day')){
                        //     let diff = moment(this.tEdit.RegisterDate).diff(moment(), 'days');
                        //     if(diff < -30){
                        //         alert('RegisterDate must be less than 30 days');
                        //     }
                        //     else{
                        //         alert('RegisterDate is invalid');
                        //     }                        
                        // }   
                        var block = $('<div class="block-loading" />');
                        $("body").prepend(block);
                        this.data.delete("transaction");
                        this.data.append('transaction', JSON.stringify(this.tEdit));
                        return axios.post(window.url +'transaction/EditTran', this.data)
                            .then(response => {
                                this.transactions = response.data;
                                this.tEdit.TransactionTypeId = '';
                                this.tEdit.CategoryId = '',
                                this.tEdit.RegisterDate = '';
                                this.tEdit.ShortDescription = '',
                                this.tEdit.Amount = '',
                                this.tEdit.Notes = '',
                                $('#modal-edit').modal('hide');
                                block.remove();
                            }).catch(error => {
                                this.error = error;
                                alert(this.error);
                                console.log(this.error);
                                block.remove();
                            })
                //     }           
                // })
            },

            newTransaction(){
                $('#modal-new').modal('show');
            },
            editTransaction(t){
                
                var block = $('<div class="block-loading" />');
                $("body").prepend(block);
                return axios.get(window.url +'transaction/GetById/' + t.TransactionId)
                    .then(response => {
                        this.tEdit = response.data;
                        this.tEdit.TransactionType = this.TransactionTypes.find(i => i.TransactionTypeId === this.tEdit.TransactionTypeId);
                        this.tEdit.Category = this.Categories.find(i => i.CategoryId === this.tEdit.CategoryId);
                        ///this.tEdit.RegisterDate = moment(this.tEdit.RegisterDate).format('DD/MM/YYYY');
                        $('#modal-edit').modal('show');
                        block.remove();
                    }).catch(error => {
                        this.error = error;
                        console.log(this.error);
                        block.remove();
                    })
                
            },
            onChangeCategory(event){
                const theTarget = event.target.options[event.target.options.selectedIndex].dataset;
                this.t.CategoryId = theTarget.value;
                this.tEdit.CategoryId = theTarget.value;
            },
            onChangeTransactionType(event){
                const theTarget = event.target.options[event.target.options.selectedIndex].dataset;
                this.tEdit.TransactionTypeId = theTarget.value;
                this.t.TransactionTypeId = theTarget.value;
            },
        }
    }
</script>