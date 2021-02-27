/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package json.model;

/**
 *
 * @author Minh Hoang
 */
public class amountChartByMonth {

    private long Amount;
    private long Month;

    public amountChartByMonth() {
        super();
    }

    public amountChartByMonth(long Amount, long Month) {
        super();
        this.Amount = Amount;
        this.Month = Month;
    }

    public void setMonth(long Month) {
        this.Month = Month;
    }

    public long getMonth() {
        return Month;
    }

    public void setAmount(long Amount) {
        this.Amount = Amount;
    }

    public long getAmount() {
        return Amount;
    }
}
