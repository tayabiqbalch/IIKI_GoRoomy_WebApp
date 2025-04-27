INSERT INTO[dbo].[tblCommonStatusAndTypes]  ([Id], [CompanyTypeId], [StatusTypeId], [StatusTypeName], [StatusId], [StatusValue], [StatusName], [ParentStatusId], [StatusDescription], [IsRecordActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
VALUES
    (46, 1, 9, N'PromotionType', 1, 1, N'Discount', NULL, N'Promotion offering a percentage or fixed amount discount', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (47, 1, 9, N'PromotionType', 2, 2, N'BOGO', NULL, N'Buy One Get One Free promotion', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (48, 1, 9, N'PromotionType', 3, 3, N'Free Shipping', NULL, N'Promotion offering free shipping', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (49, 1, 9, N'PromotionType', 4, 4, N'Flash Sale', NULL, N'Limited-time sale with significant discounts', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (50, 1, 9, N'PromotionType', 5, 5, N'Bundled Promotion', NULL, N'Promotion offering a discount for bundled products', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (51, 1, 9, N'PromotionType', 6, 6, N'Cashback', NULL, N'Promotion offering cashback after purchase', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (52, 1, 9, N'PromotionType', 7, 7, N'Referral', NULL, N'Promotion rewarding customers for referring others', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (53, 1, 9, N'PromotionType', 8, 8, N'Loyalty/Points', NULL, N'Promotion rewarding customers with points for purchases', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE());

INSERT INTO[dbo].[tblCommonStatusAndTypes] ([Id], [CompanyTypeId], [StatusTypeId], [StatusTypeName], [StatusId], [StatusValue], [StatusName], [ParentStatusId], [StatusDescription], [IsRecordActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
VALUES
    (54, 1, 10, N'DiscountType', 1, 1, N'Percentage Discount', NULL, N'Discount applied as a percentage of the total price or item price', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (55, 1, 10, N'DiscountType', 2, 2, N'Fixed Amount Discount', NULL, N'Discount applied as a fixed amount off the total price or item price', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (56, 1, 10, N'DiscountType', 3, 3, N'Volume Discount', NULL, N'Discount applied when purchasing in larger quantities or volumes', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (57, 1, 10, N'DiscountType', 4, 4, N'Seasonal Discount', NULL, N'Discount applied during specific seasons or holidays', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (58, 1, 10, N'DiscountType', 5, 5, N'Clearance Discount', NULL, N'Discount applied to clear out old inventory or end-of-life products', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (59, 1, 10, N'DiscountType', 6, 6, N'Employee Discount', NULL, N'Discount applied exclusively to employees of the company', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE()),
    (60, 1, 10, N'DiscountType', 7, 7, N'VIP Discount', NULL, N'Discount applied to customers with VIP status or special membership', 1, N'MTIC', GETDATE(), N'MTIC', GETDATE());
