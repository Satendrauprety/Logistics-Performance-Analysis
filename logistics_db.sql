-- Logistics Analysis: OTD (On-Time Delivery) Dashboard Logic
CREATE TABLE Shipments (
    TrackingID VARCHAR(20) PRIMARY KEY,
    OriginCity VARCHAR(50),
    DestCity VARCHAR(50),
    Status VARCHAR(20),
    Weight DECIMAL(10,2),
    ShipmentDate DATE,
    ExpectedDelivery DATE,
    ActualDelivery DATE
);

-- Sample Data for Noida-Gurgaon-Morena routes
INSERT INTO Shipments VALUES 
('TRK101', 'Noida', 'Gurgaon', 'Delivered', 2.0, '2024-04-10', '2024-04-12', '2024-04-12'),
('TRK102', 'Gurgaon', 'Noida', 'Delivered', 1.5, '2024-04-11', '2024-04-13', '2024-04-14'),
('TRK103', 'Noida', 'Morena', 'Pending', 4.5, '2024-04-12', '2024-04-15', NULL);

-- KPI Query: Calculate On-Time Delivery Percentage
SELECT 
    OriginCity, 
    COUNT(*) as Total_Orders,
    SUM(CASE WHEN ActualDelivery <= ExpectedDelivery THEN 1 ELSE 0 END) * 100.0 / COUNT(*) as OTD_Percent
FROM Shipments
WHERE Status = 'Delivered'
GROUP BY OriginCity;
