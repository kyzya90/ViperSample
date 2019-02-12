# ViperTemplate
Simple ios VIPER Example. This example describes base connections between modules working with services and initialization of modules.

How to run:
1. Download sample
2. Install carthage if needed (How to: https://github.com/Carthage/Carthage)
3. Open it using terminal
4. Install additional frameworks using Carthage (carthage update --cache-builds --platform ios)
5. Run


Components Description

1. DependencyContainer. 
An object which particular services inside.
2. DependencyProvider.
An object which create and holds DependencyContainers. Internal implementation allows to resolve all dependencies inside provider and provide ready-to-use container.

3. CoreDataService. General DB service which implements base saving-loading mechanism
4. EntityDataService. DB service which works with entities.

5. Misc. Useful addition.
