/*
Calculate specimen width in pixels using a line profile
Requires:
- Single channel image stack
- Line profile drawn on image
Output:
- Text file on desktop with numeric data with format:
    ImageJ macro - Stack profile Plot
    Total image slices = 56
    Pixels in profile plot = 40
    
    Rows of Plot Intensities:
    110, 126, 108, 107, ...
    108, 111, 115, 105, ...
    112, 103, 102, 99, ...
    ...
Modified from http://imagej.nih.gov/ij/macros/StackProfilePlot.txt
Pariksheet Nanda <pariksheet.nanda@gmail.com>
 */

/* 
Further modifications: 
1) added support for multiple ROIs using roiManager
2) removed bitmap
3) output for all images in stack
4) removed all descriptive output to simplify file for post-processing in python
JJ<liujj90@gmail.com>
 */

 

macro "Western BLot profile plot" {




Y_MIN = 0;
Y_MAX = 16383;

// sanity check
/*if (nSlices==1)
  exit("Stack required");

setBatchMode(true);
saveSettings();
run("Profile Plot Options...", 
    "width=400 height=400 minimum="+Y_MIN+" maximum="+Y_MAX+" fixed"
    );

// prepare stacks
original_stack = getImageID;
plot_stack = 0;
total_slices = nSlices;
 */   
// save to file
home = getDirectory("home"); // Returns the path to users home directory.
if (home == "")
    exit("No desktop directory available");
temp_file = home + "Desktop/" + getInfo("image.filename") + "_profiles.txt";
f = File.open(temp_file);


b = roiManager("count");
for(i = 0; i < b; i++) {
	roiManager("Select", i);    
    /*for (slice = 1; slice <= total_slices; slice++) {
        
        showProgress(slice, total_slices);
        
        selectImage(original_stack);
        setSlice(slice);
        */
    // get plot data
    value = getProfile();
    positions = lengthOf(value);
    
    // write slice plot to file
    
    file_str = toString(value[0]);
    for (pixel = 1; pixel < positions; pixel++)
        file_str += ", " + value[pixel];
    print(f, file_str);
    
    }
    print(f, "");
}
setSlice(1);
setBatchMode(false);
restoreSettings();



}