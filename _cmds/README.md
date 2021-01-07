# Fedeas Development

## Getting started

1. Download the `FEDEASLab/fedeas` repository and place it at the root of your FEDEASLab development environment.
2. Open a terminal window and make this root your current directory.
   > Note: If your Python/Anaconda distribution is installed system-wide, you may need to run this shell with administrator privileges.
3. Run the following command:
   ```shell
   fedeas> python setup.py develop
   ```
   This should make the `fmake` program available to you from your command line environment.

4. Open the file `fedeas/_conf/user.yaml` with your favorite text editor, and change the value of the `git` variable to point to your `git` executable.

5. Run the following command to initialize `fmake` and its dependencies. This can be done from any directory.
   ```shell
   >fmake init
   ```
   Once all of the installation operations are complete, you should be able to run the following commands without receiving an error message:
   ```shell
   >aurore --help
   >elstir --help
   >rendre --help
   ```


