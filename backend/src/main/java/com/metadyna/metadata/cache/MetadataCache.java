package com.metadyna.metadata.cache;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import com.metadyna.config.AppProperties;
import com.metadyna.metadata.model.ModuleMetadata;
import com.metadyna.metadata.model.UiMetadata;
import com.metadyna.metadata.model.UiMetadataBundle;
import com.metadyna.module.model.MenuGroup;
import com.metadyna.module.model.ModuleEntry;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

/**
 * Caffeine-backed in-memory cache for three domains:
 *
 *  1. Module metadata  — key: "{tenantId}:{moduleId}"  — TTL: metadata-ttl-minutes
 *  2. Menu groups      — key: "{tenantId}"              — TTL: menu-ttl-minutes
 *  3. Module registry  — key: "{tenantId}"              — TTL: menu-ttl-minutes
 *
 * All caches are manually managed (no Spring @Cacheable) for explicit eviction control.
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class MetadataCache {

    private final AppProperties appProperties;

    private Cache<String, ModuleMetadata> moduleMetadataCache;
    private Cache<String, UiMetadataBundle> uiMetadataBundleCache;
    private Cache<String, List<MenuGroup>> menuGroupsCache;
    private Cache<String, List<ModuleEntry>> modulesCache;

    @PostConstruct
    public void init() {
        AppProperties.Cache cfg = appProperties.getCache();

        moduleMetadataCache = Caffeine.newBuilder()
                .maximumSize(cfg.getMaxSize())
                .expireAfterWrite(cfg.getMetadataTtlMinutes(), TimeUnit.MINUTES)
                .recordStats()
                .build();

        uiMetadataBundleCache = Caffeine.newBuilder()
                .maximumSize(cfg.getMaxSize())
                .expireAfterWrite(cfg.getMetadataTtlMinutes(), TimeUnit.MINUTES)
                .recordStats()
                .build();

        menuGroupsCache = Caffeine.newBuilder()
                .maximumSize(cfg.getMaxSize())
                .expireAfterWrite(cfg.getMenuTtlMinutes(), TimeUnit.MINUTES)
                .recordStats()
                .build();

        modulesCache = Caffeine.newBuilder()
                .maximumSize(cfg.getMaxSize())
                .expireAfterWrite(cfg.getMenuTtlMinutes(), TimeUnit.MINUTES)
                .recordStats()
                .build();

        log.info("MetadataCache initialized — metadata TTL={}m, menu TTL={}m, maxSize={}",
                cfg.getMetadataTtlMinutes(), cfg.getMenuTtlMinutes(), cfg.getMaxSize());
    }

    // ── Module Metadata ───────────────────────────────────────────────────────

    public Optional<UiMetadataBundle> getUiMetadataBundle(String tenantId, String moduleId) {
        return Optional.ofNullable(uiMetadataBundleCache.getIfPresent(metaKey(tenantId, moduleId)));
    }

    public Optional<ModuleMetadata> getModuleMetadata(String tenantId, String moduleId) {
        return Optional.ofNullable(moduleMetadataCache.getIfPresent(metaKey(tenantId, moduleId)));
    }

    public void putModuleMetadata(String tenantId, String moduleId, ModuleMetadata metadata) {
        moduleMetadataCache.put(metaKey(tenantId, moduleId), metadata);
    }

    public void evictModuleMetadata(String tenantId, String moduleId) {
        moduleMetadataCache.invalidate(metaKey(tenantId, moduleId));
        log.debug("Evicted module metadata cache: tenant={}, module={}", tenantId, moduleId);
    }

    public void evictAllModuleMetadata(String tenantId) {
        // Invalidate all keys starting with tenantId prefix
        moduleMetadataCache.asMap().keySet().stream()
                .filter(k -> k.startsWith(tenantId + ":"))
                .forEach(moduleMetadataCache::invalidate);
        log.debug("Evicted all module metadata cache for tenant={}", tenantId);
    }

    // ── Menu Groups ───────────────────────────────────────────────────────────

    public Optional<List<MenuGroup>> getMenuGroups(String tenantId) {
        return Optional.ofNullable(menuGroupsCache.getIfPresent(tenantId));
    }

    public void putMenuGroups(String tenantId, List<MenuGroup> groups) {
        menuGroupsCache.put(tenantId, groups);
    }

    public void evictMenuGroups(String tenantId) {
        menuGroupsCache.invalidate(tenantId);
        log.debug("Evicted menu groups cache for tenant={}", tenantId);
    }

    // ── Module Registry ───────────────────────────────────────────────────────

    public Optional<List<ModuleEntry>> getModules(String tenantId) {
        return Optional.ofNullable(modulesCache.getIfPresent(tenantId));
    }

    public void putModules(String tenantId, List<ModuleEntry> modules) {
        modulesCache.put(tenantId, modules);
    }

    public void evictModules(String tenantId) {
        modulesCache.invalidate(tenantId);
        log.debug("Evicted modules cache for tenant={}", tenantId);
    }

    // ── Helper ────────────────────────────────────────────────────────────────

    private String metaKey(String tenantId, String moduleId) {
        return tenantId + ":" + moduleId;
    }
}
