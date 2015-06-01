//
//  CustomerCareDetails.m
//  Internet Usage
//
//  Created by Harsh Sapra on 05/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "CustomerCareDetails.h"

@implementation CustomerCareDetails

- (id)init {
    self = [super init];
    
    if(self) {
        self.states = [[NSArray alloc] initWithObjects:@"Andhra Pradesh", @"Delhi", @"Gujarat", @"Haryana", @"Karnataka", @"Kerala", @"Madhya Pradesh", @"Maharashtra", @"Mumbai", @"Punjab", @"Rajasthan", @"Tamil Nadu", @"U.P. West", @"U.P. East", @"West Bengal", nil];
        
        NSMutableDictionary *andhraPradesh = [[NSMutableDictionary alloc] init];
        [andhraPradesh setObject:@"+914044444121" forKey:@"Hyderabad"];
        
        NSMutableDictionary *delhi = [[NSMutableDictionary alloc] init];
        [delhi setObject:@"+911144444121" forKey:@"Delhi"];
        
        NSMutableDictionary *gujarat = [[NSMutableDictionary alloc] init];
        [gujarat setObject:@"+917944444121" forKey:@"Ahmedabad"];
        [gujarat setObject:@"+912884444121" forKey:@"Jamnagar"];
        [gujarat setObject:@"+912614444121" forKey:@"Surat"];
        
        NSMutableDictionary *haryana = [[NSMutableDictionary alloc] init];
        [haryana setObject:@"+911714444121" forKey:@"Ambala"];
        [haryana setObject:@"+911294444121" forKey:@"Faridabad"];
        [haryana setObject:@"+911244444121" forKey:@"Gurgaon"];
        [haryana setObject:@"+911844444121" forKey:@"Karnal"];
        [haryana setObject:@"+911275444121" forKey:@"Palwal"];
        [haryana setObject:@"+911804444121" forKey:@"Panipat"];
        [haryana setObject:@"+911304444121" forKey:@"Sonepat"];
        
        NSMutableDictionary *karnataka = [[NSMutableDictionary alloc] init];
        [karnataka setObject:@"+918110444121" forKey:@"Anekal"];
        [karnataka setObject:@"+918044444121" forKey:@"Bangalore"];
        [karnataka setObject:@"+918314444121" forKey:@"Belgaum"];
        [karnataka setObject:@"+918262444121" forKey:@"Chikmaglur"];
        [karnataka setObject:@"+918364444121" forKey:@"Hubli"];
        [karnataka setObject:@"+918382444121" forKey:@"Karwar"];
        [karnataka setObject:@"+918152444121" forKey:@"Kolar"];
        [karnataka setObject:@"+918254444121" forKey:@"Kundapur"];
        [karnataka setObject:@"+918232444121" forKey:@"Mandya"];
        [karnataka setObject:@"+918244444121" forKey:@"Mangalore"];
        [karnataka setObject:@"+918214444121" forKey:@"Mysore"];
        [karnataka setObject:@"+918182444121" forKey:@"Shimoga"];
        [karnataka setObject:@"+918164444121" forKey:@"Tumkur"];
        [karnataka setObject:@"+918204444121" forKey:@"Udupi"];
        
        NSMutableDictionary *kerala = [[NSMutableDictionary alloc] init];
        [kerala setObject:@"+914954444121" forKey:@"Calicut"];
        [kerala setObject:@"+914844444121" forKey:@"Ernakulam"];
        [kerala setObject:@"+914714444121" forKey:@"Trivandrum"];
        
        NSMutableDictionary *madhyaPradesh = [[NSMutableDictionary alloc] init];
        [madhyaPradesh setObject:@"+917632444121" forKey:@"Balaghat"];
        [madhyaPradesh setObject:@"+917141444121" forKey:@"Betul"];
        [madhyaPradesh setObject:@"+917554444121" forKey:@"Bhopal"];
        [madhyaPradesh setObject:@"+917752444121" forKey:@"Bilaspur"];
        [madhyaPradesh setObject:@"+917325444121" forKey:@"Burhanpur"];
        [madhyaPradesh setObject:@"+917682444121" forKey:@"Chhatarpur"];
        [madhyaPradesh setObject:@"+917524444121" forKey:@"Dabra"];
        [madhyaPradesh setObject:@"+917812444121" forKey:@"Damoh"];
        [madhyaPradesh setObject:@"+917522444121" forKey:@"Datia"];
        [madhyaPradesh setObject:@"+917572444121" forKey:@"Dewas"];
        [madhyaPradesh setObject:@"+917292444121" forKey:@"Dhar"];
        [madhyaPradesh setObject:@"+917884444121" forKey:@"Durg"];
        [madhyaPradesh setObject:@"+917539444121" forKey:@"Gohad"];
        [madhyaPradesh setObject:@"+917480444121" forKey:@"Goharganj"];
        [madhyaPradesh setObject:@"+917542444121" forKey:@"Guna"];
        [madhyaPradesh setObject:@"+917514444121" forKey:@"Gwalior"];
        [madhyaPradesh setObject:@"+917574444121" forKey:@"Hoshangabad"];
        [madhyaPradesh setObject:@"+917314444121" forKey:@"Indore"];
        [madhyaPradesh setObject:@"+917572444121" forKey:@"Itarsi"];
        [madhyaPradesh setObject:@"+917614444121" forKey:@"Jabalpur"];
        [madhyaPradesh setObject:@"+917414444121" forKey:@"Jaora"];
        [madhyaPradesh setObject:@"+917622444121" forKey:@"Katni"];
        [madhyaPradesh setObject:@"+917334444121" forKey:@"Khandwa"];
        [madhyaPradesh setObject:@"+917422444121" forKey:@"Mandsaur"];
        [madhyaPradesh setObject:@"+917324444121" forKey:@"Mhow"];
        [madhyaPradesh setObject:@"+917532444121" forKey:@"Morena"];
        [madhyaPradesh setObject:@"+917792444121" forKey:@"Narsinghpur"];
        [madhyaPradesh setObject:@"+917423444121" forKey:@"Neemuch"];
        [madhyaPradesh setObject:@"+917721444121" forKey:@"Neora"];
        [madhyaPradesh setObject:@"+917714444121" forKey:@"Raipur"];
        [madhyaPradesh setObject:@"+917744444121" forKey:@"Rajnandgaon"];
        [madhyaPradesh setObject:@"+917412444121" forKey:@"Ratlam"];
        [madhyaPradesh setObject:@"+917662444121" forKey:@"Rewa"];
        [madhyaPradesh setObject:@"+917582444121" forKey:@"Sagar"];
        [madhyaPradesh setObject:@"+917672444121" forKey:@"Satna"];
        [madhyaPradesh setObject:@"+917562444121" forKey:@"Sehore"];
        [madhyaPradesh setObject:@"+917692444121" forKey:@"Seoni"];
        [madhyaPradesh setObject:@"+917492444121" forKey:@"Shivpuri"];
        [madhyaPradesh setObject:@"+917562444121" forKey:@"Sehora"];
        [madhyaPradesh setObject:@"+917692444121" forKey:@"Seoni"];
        [madhyaPradesh setObject:@"+917492444121" forKey:@"Shivpuri"];
        [madhyaPradesh setObject:@"+917624444121" forKey:@"Sihora"];
        [madhyaPradesh setObject:@"+917344444121" forKey:@"Ujjain"];
        [madhyaPradesh setObject:@"+917592444121" forKey:@"Vidisha"];
        
        NSMutableDictionary *maharashtra = [[NSMutableDictionary alloc] init];
        [maharashtra setObject:@"+912044444121" forKey:@"Pune"];
        
        NSMutableDictionary *mumbai = [[NSMutableDictionary alloc] init];
        [mumbai setObject:@"+912244444121" forKey:@"Mumbai"];
        
        NSMutableDictionary *punjab = [[NSMutableDictionary alloc] init];
        [punjab setObject:@"+911724444121" forKey:@"Chandigarh"];
        [punjab setObject:@"+911814444121" forKey:@"Jalandhar"];
        [punjab setObject:@"+911614444121" forKey:@"Ludhiana"];
        [punjab setObject:@"+911824444121" forKey:@"Phadgwara"];
        [punjab setObject:@"+911853444121" forKey:@"Rayya"];
        [punjab setObject:@"+911881444121" forKey:@"Ropar"];
        [punjab setObject:@"+911672444121" forKey:@"Sangrur"];
        
        NSMutableDictionary *rajasthan = [[NSMutableDictionary alloc] init];
        [rajasthan setObject:@"+911414444121" forKey:@"Jaipur"];
        
        NSMutableDictionary *tamilNadu = [[NSMutableDictionary alloc] init];
        [tamilNadu setObject:@"+914444444121" forKey:@"Chennai"];
        [tamilNadu setObject:@"+914224444121" forKey:@"Coimbatore"];
        [tamilNadu setObject:@"+914244444121" forKey:@"Erode"];
        [tamilNadu setObject:@"+914344444121" forKey:@"Hosur"];
        [tamilNadu setObject:@"+914565444121" forKey:@"Karaikudi"];
        [tamilNadu setObject:@"+914524444121" forKey:@"Madurai"];
        [tamilNadu setObject:@"+914652444121" forKey:@"Nagercoli"];
        [tamilNadu setObject:@"+914134444121" forKey:@"Pondicherry"];
        [tamilNadu setObject:@"+914274444121" forKey:@"Salem"];
        [tamilNadu setObject:@"+914362444121" forKey:@"Thanjavur"];
        [tamilNadu setObject:@"+914549444121" forKey:@"Thirumanglam"];
        [tamilNadu setObject:@"+914624444121" forKey:@"Tirunelveli"];
        [tamilNadu setObject:@"+914214444121" forKey:@"Tirpur"];
        [tamilNadu setObject:@"+914314444121" forKey:@"Trichy"];
        [tamilNadu setObject:@"+914614444121" forKey:@"Tuticorin"];
        [tamilNadu setObject:@"+914164444121" forKey:@"Vellore"];
        [tamilNadu setObject:@"+914562444121" forKey:@"Virudhunagar"];
        
        NSMutableDictionary *upWest = [[NSMutableDictionary alloc] init];
        [upWest setObject:@"+915624444121" forKey:@"Agra"];
        [upWest setObject:@"+911204444121" forKey:@"Ghaziabad"];
        [upWest setObject:@"+911214444121" forKey:@"Meerut"];
        [upWest setObject:@"+911204444121" forKey:@"Noida"];
        
        NSMutableDictionary *upEast = [[NSMutableDictionary alloc] init];
        [upEast setObject:@"+915224444121" forKey:@"Lucknow"];
        
        NSMutableDictionary *westBengal = [[NSMutableDictionary alloc] init];
        [westBengal setObject:@"+913344444121" forKey:@"Kolkata"];
        
        self.cities = [[NSArray alloc] initWithObjects:andhraPradesh, delhi, gujarat, haryana, karnataka, kerala, madhyaPradesh, maharashtra, mumbai, punjab, rajasthan, tamilNadu, upWest, upEast, westBengal, nil];
    }
    
    return self;
}

@end
