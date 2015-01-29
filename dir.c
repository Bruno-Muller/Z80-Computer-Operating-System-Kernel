#include "dir.h"

#define MBR_ADDRESS			0x1100
#define BPB_ADDRESS			0x1300
#define ROOT_DIR_ADDRESS	0x2100

#define MBR_PTR				(void*) MBR_ADDRESS
#define BPB_PTR				(void*) BPB_ADDRESS
#define ROOT_DIR_PTR		(void*) ROOT_DIR_ADDRESS

#define ROOT_ENTRY_COUNT	0x200
#define BYTE_PER_SECTOR		0x200

void print_dirdate(unsigned int date) {
	unsigned int year = (date>>9) + 1980;
	unsigned int month = (date>>5) & 0x000F;
	unsigned int day = date & 0x001F;
	
	print_unsigned_int(year,4);
	putc('-');
	print_unsigned_int(month,2);
	putc('-');
	print_unsigned_int(day,2);
}

void print_dirtime(unsigned int time) {
	unsigned int hours = time>>11;
	unsigned int min = (time>>5) & 0x003F;
	unsigned int sec = (time & 0x000F)<<1;
	
	print_unsigned_int(hours,2);
	putc(':');
	print_unsigned_int(min,2);
	putc(':');
	print_unsigned_int(sec,2);

}

void print_dirname(const char* string) {
	unsigned char i;
	for (i=0;i<11;i++) {
		bios_conout(string[i]);
	}
}

void print_dirattr(unsigned char attr) {
	if (attr == ATTR_LONG_NAME) {
		print("        LONG NAME       ");
		return;
	}
	print((attr & ATTR_DIRECTORY)?"DIR":"---");
	print((attr & ATTR_VOLUME_ID)?" VID":" ---");
	print((attr & ATTR_SYSTEM)?" SYS":" ---");
	print((attr & ATTR_HIDDEN)?" HID":" ---");
	print((attr & ATTR_READ_ONLY)?" RO":" --");
	print((attr & ATTR_ARCHIVE)?" ARCH":" ----");
}

void ccp_dir() {
	// MBR
	const MasterBootRecord* const mbr = MBR_PTR;
	const PartitionDescriptor* const partition = &mbr->partitionTable[0];
	unsigned char i;
	
	// BPB
	const BiosParameterBlock* const bpb = BPB_PTR;
	unsigned char const RootDirSectors = ((ROOT_ENTRY_COUNT*32) + (BYTE_PER_SECTOR - 1))/BYTE_PER_SECTOR;
	const unsigned int AbsoluteFirstRootDirSecNum = bpb->BPB_RsvSecCnt + bpb->BPB_NumFATs * bpb->BPB_FATs16 + partition->firstPartitionSector;
	
	// Root Directory
	DirectoryEntry* const rootDirectory = ROOT_DIR_PTR;
	unsigned char sector;
	DirectoryEntry* entry;
	
	print("\r\n    NAME           ATTRIBUTES       SIZE     DATE      TIME");
	print("\r\n----------- ----------------------- ----- ---------- --------");
				
	// List Root Directory
	for (sector = 0; sector < RootDirSectors; sector++) {
		// Load a root directory sector;
		bios_setsec(AbsoluteFirstRootDirSecNum + sector);
		bios_setdma(rootDirectory);
		bios_read();
		
		entry = rootDirectory;

		for (i=0; i<16; i++, entry++) {
			if (entry->DIR_Name[0] == 0x00) {sector = RootDirSectors; break;} // end of directory
			if (entry->DIR_Name[0] == 0xE5) continue; // deleted file
			if (entry->DIR_Attr == ATTR_LONG_NAME) continue;

			print("\r\n");
			print_dirname(entry->DIR_Name);
			putc(' ');
			print_dirattr(entry->DIR_Attr);
			putc(' ');
			print_unsigned_int((unsigned int) entry->DIR_FileSize, 5);
			putc(' ');
			print_dirdate(entry->DIR_WrtDate);
			putc(' ');
			print_dirtime(entry->DIR_WrtTime);
		}
	}
}