# Additional Scenarios for AutoCar Dealership

## 1. Failed Credit Application
- Customer applies for credit but is rejected due to insufficient income or incomplete documents.
- Status: Rejected.

## 2. Canceled Booking
- Customer cancels the booking after paying the booking fee.
- Status: Canceled.

## 3. Bulk Purchase by Corporate Customer
- A corporate customer purchases multiple cars in a single transaction.
- Payment method: Cash or credit.

## 4. Warranty Claim for Defective Car
- Customer files a warranty claim for a car with manufacturing defects.
- Status: Pending or Approved.

## 5. Stock Mutation Between Dealers
- Cars are transferred from one dealer to another due to stock shortages.
- Status: Completed.

## 6. Late Payment for Installments
- Customer delays installment payments beyond the due date.
- Status: Overdue.

## 7. Customer Complaint About Service
- Customer files a complaint regarding poor service or delivery delays.
- Status: Resolved or Pending.

## 8. First Service Follow-Up
- Dealer follows up with the customer for the first service after car delivery.
- Status: Completed.
## 9. Register New Customer Using Stored Procedure
- A new customer is registered using the stored procedure `sp_RegisterCustomer`.
- This ensures proper encapsulation of the registration logic.

## 10. Calculate Total Price Using Function
- The function `fn_CalculateTotalPrice` is used to calculate the total price after applying discounts.
- This validates the function's correctness.

## 11. Test Trigger for Stock Update
- The trigger `trg_UpdateStockAfterSale` is tested by inserting a new transaction detail.
- This ensures the stock is updated correctly in the `Inventory` table.

---
These scenarios expand the scope of the project and provide additional edge cases for testing.