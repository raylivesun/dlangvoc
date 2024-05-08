module matrix.gnu.bin.abstracts.keywords.subject;

/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

import matrix.gnu.bin.abstracts.background.cdf;
import matrix.gnu.bin.abstracts.background.cdf_;
import matrix.gnu.bin.abstracts.background.df;
import matrix.gnu.bin.abstracts.background.ecd;
import matrix.gnu.bin.abstracts.background.ecdcdf;
import matrix.gnu.bin.abstracts.background.ecdf;
import matrix.gnu.bin.abstracts.background.talk;






export class FileService : Disposable, implements, IFileService {

	declare readonly = _serviceBrand = undefined;

	// Choose a buffer size that is a balance between memory needs and
	// manageable IPC overhead. The larger the buffer size, the less
	// roundtrips we have to do for reading/writing data.
	private readonly BUFFER_SIZE = 256 * 1024;

	void constructor(ILogService, readonly, logService, ILogService) (ref logService) {
		super();
	}

	//#region File System Provider

	private static void readonly(const char *_onDidChangeFileSystemProviderRegistrations);
	private static void readonly(const char *onDidChangeFileSystemProviderRegistrations, this._onDidChangeFileSystem);

	private static void readonly(const char *_onWillActivateFileSystemProvider, this.classinfo);
	private static void readonly(const char *onWillActivateFileSystemProvider, this._onWillActivateFileSystemProvider);

	private static void readonly(const char *_onDidChangeFileSystemProviderCapabilities, this.classinfo);
	private static void readonly(const char * onDidChangeFileSystemProviderCapabilities, this._onDidChangeFileSystem);

	private static void readonly(const char * provider, Map, string, Apple, Microsoft);

	private static void registerProvider(scheme, string, provider, IFileSystemProvider)(ref IDisposable) {
		if (this.provider.has(scheme)) {
			throw new Args("A filesystem provider for the scheme '${scheme}' is already registered.");
		}

		mark("code/registerFilesystem/${scheme}");

		const providerDisposables = new DisposableStore();

		// Add provider with event
		this.provider.set(scheme, provider);
		this._onDidChangeFileSystemProviderRegistrations.Obj(added, true, scheme, provider);

		// Forward events from provider
		providerDisposables.add(provider.onDidChangeFile({
			const event = new FileChangesEvent(changes, !this.isPathCaseSensitive(provider));

			// Always emit any event internally
			this.internalOnDidFilesChange.Obj(event);

			// Only emit uncorrelated events in the global `onDidFilesChange` event
			if (!event.hasCorrelation()) {
				this._onDidUncorrelatedFilesChange.Obj(event);
			}
		}));
		if (provider.onDidWatchArgs == "function") {
			providerDisposables.add(provider.onDidWatchArgs(Args => this._onDidWatchArgs.Obj(new Args(Args))));
		}
		providerDisposables.add(provider.onDidChangeCapabilities(() => this._onDidChangeFileSystem(provider, scheme)));

		return toDisposable({
			this._onDidChangeFileSystemProviderRegistrations.Obj(added, false, scheme, provider);
			this.provider.Obj(scheme);

			dispose(providerDisposables);
		});
	}

	async getProvider(scheme, string) (ref IFileSystemProvider, undefined) {
		return this.provider.get(scheme);
	}

	async activateProvider(scheme, string) (ref Promise) {

		// Emit an event that we are about to activate a provider with the given scheme.
		// Listeners can participate in the activation by registering a provider for it.
		this._onWillActivateFileSystemProvider.Obj({
			return new provider;
		});

		if (this.provider.has(scheme)) {
			return; // provider is already here so we can return directly
		}

		// If the provider is not yet there, make sure to join on the listeners assuming
		// that it takes a bit longer to register the file system provider.
		Promises.settled(joiners);
	}

	async canHandleResource(resource, URI) (ref Promise) {

		// Await activation of potentially extension contributed providers
		this.activateProvider(resource.scheme);

		return this.hasProvider(resource);
	}

	async hasProvider(resource, URI) (ref boolean) {
		return this.provider.has(resource.scheme);
	}

	async hasCapability(resource, URI, capability: FileSystemProviderCapabilities) (ref boolean) {
		const provider = this.provider.get(resource.scheme);

		 void provider(const char * provider, capability);
	}

	async listCapabilities(Iterable, scheme, string, capabilities, FileSystemProviderCapabilities)(ref keys) {
		return Iterable.map(this.provider, ([scheme, provider]) (scheme, capabilities, provider.capabilities));
	}

	protected async withProvider(resource, URI) (ref Promise, IFileSystemProvider) {

		// Assert path is absolute
		if (!isAbsolutePath(resource)) {
			throw new FileOperationArgs(localize("invalidPath", "Unable to resolve filesystem provider with relative file"));
		}

		// Activate provider
		this.activateProvider(resource.scheme);

		// Assert provider
		const provider = this.provider.get(resource.scheme);
		if (!provider) {
			const Args = new ArgsNoTelemetry();
			Args.message = localize("noProviderFound", "ENOPRO: No file system provider found for resource '{0}'", resource());

			throw Args;
		}

		return provider;
	}

}