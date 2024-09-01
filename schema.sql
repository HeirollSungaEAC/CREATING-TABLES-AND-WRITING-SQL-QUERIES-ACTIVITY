-- Create Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Password VARCHAR(255),
    DateRegistered TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Posts Table
CREATE TABLE Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    PostDescription VARCHAR(255),
    PostedBy INT,
    IsVisible BOOLEAN,
    DatePosted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostedBy) REFERENCES Users(UserID)
);

-- Create Comments Table
CREATE TABLE Comments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,
    CommentDescription VARCHAR(255),
    AddedBy INT,
    PostID INT,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AddedBy) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

-- Create Groups Table
CREATE TABLE Groups (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(100),
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create GroupMembership Table
CREATE TABLE GroupMembership (
    MembershipID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    UserID INT,
    IsAccepted BOOLEAN DEFAULT FALSE,
    RequestDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Friends Table
CREATE TABLE Friends (
    FriendshipID INT AUTO_INCREMENT PRIMARY KEY,
    UserID1 INT,
    UserID2 INT,
    DateFriended TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID1) REFERENCES Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES Users(UserID)
);

-- Create FriendRequests Table
CREATE TABLE FriendRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RequesterID INT,
    RequesteeID INT,
    IsAccepted BOOLEAN DEFAULT FALSE,
    RequestDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RequesterID) REFERENCES Users(UserID),
    FOREIGN KEY (RequesteeID) REFERENCES Users(UserID)
);

-- Create GroupPosts Table
CREATE TABLE GroupPosts (
    GroupPostID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    PostID INT,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

-- Insert records into Users Table
INSERT INTO Users (UserID, Username, FirstName, LastName, DateOfBirth, Password) VALUES
(1, 'blairwald0rf', 'Jamie', 'Dabao', '2003-04-05', 'hdvwsoskd'),
(2, 'Hiro', 'Heiroll', 'Sunga', '2003-05-26', 'hdhwodnwjd'),
(3, 'Shiminet', 'Fiona', 'Duterte', '1999-01-15', 'wnodwps'),
(4, 'Pokemon', 'Pika', 'chu', '1996-02-27', 'pdbwidnfg'),
(5, 'WayBackWhen', 'Sarah', 'Geronimo', '2024-09-01', 'pwnfjsdl');

-- Insert records into Posts Table
INSERT INTO Posts (PostID, PostDescription, PostedBy, IsVisible) VALUES
(1, 'Summer has come and passed', 1, TRUE),
(2, 'The innocent can never last', 2, TRUE),
(3, 'Wake me up when September ends', 3, TRUE),
(4, 'Like my fathers come to pass', 4, TRUE),
(5, 'Seven years has gone so fast', 5, TRUE),
(6, 'Wake me up when September end', 1, FALSE),
(7, 'The leaves are falling all around', 2, TRUE),
(8, 'Like pieces of a broken crown', 3, TRUE),
(9, 'But Ill be there when the sun goes down', 4, TRUE),
(10, 'To watch the world turn upside down', 5, TRUE);

-- Insert records into Comments Table
INSERT INTO Comments (CommentID, CommentDescription, AddedBy, PostID) VALUES
(1, 'eyyyyyy', 2, 1),
(2, 'brad ganun ka kayaman', 3, 2),
(3, 'very demure', 4, 3),
(4, 'skibidy', 1, 4),
(5, 'fanum tax', 5, 5),
(6, 'haundred four day', 3, 6),
(7, 'what the heck a kilometo', 4, 7),
(8, 'what a sigma', 1, 8),
(9, 'gehgehgehgeh', 2, 9),
(10, 'what up my heart', 4, 10);

-- Insert records into Groups Table
INSERT INTO Groups (GroupID, GroupName) VALUES
(1, 'KristyCrab workers'),
(2, 'Racer HQ');

-- Insert records into GroupMembership Table
INSERT INTO GroupMembership (MembershipID, GroupID, UserID, IsAccepted) VALUES
(1, 1, 1, TRUE),
(2, 1, 3, FALSE),
(3, 2, 2, TRUE),
(4, 2, 4, FALSE),
(5, 2, 5, TRUE);

-- Insert records into Friends Table
INSERT INTO Friends (FriendshipID, UserID1, UserID2) VALUES
(1, 1, 2),
(2, 3, 5),
(3, 4, 2);

-- Insert records into FriendRequests Table
INSERT INTO FriendRequests (RequestID, RequesterID, RequesteeID, IsAccepted) VALUES
(1, 1, 3, FALSE),
(2, 2, 4, TRUE),
(3, 5, 1, TRUE),
(4, 1, 2, FALSE);

-- Insert records into GroupPosts Table
INSERT INTO GroupPosts (GroupPostID, GroupID, PostID) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 2, 10);
